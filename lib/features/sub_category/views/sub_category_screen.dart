import 'package:flutter/material.dart';
import 'package:flutter_core/features/sub_category/views/widgets/area_search_autocomplete.dart';
import 'package:flutter_core/features/sub_category/views/widgets/filter_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../build_context.dart';
import '../../../core/theme/theme.dart';
import '../../../core/theme/ui_utils.dart';
import '../../../core/widgets/custom_text.dart';
import '../../add_details/ad_details_screen.dart';
import '../../common/base_scaffold.dart';
import '../controllers/sub_category_provider.dart';
import '../models/sub_category_response.dart';
import '../services/sub_category_service.dart';
import 'map_view_cat_view.dart';

class SubCategoryScreen extends ConsumerStatefulWidget {
  final String catName;
  final int catId;
  final List<dynamic> breadCrumbItems;

  const SubCategoryScreen({
    super.key,
    required this.catName,
    required this.catId,
    required this.breadCrumbItems,
  });

  @override
  ConsumerState<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends ConsumerState<SubCategoryScreen> {
  late final ScrollController controller = ScrollController();

  // 🔹 متغيرات حالة الفلترة (السعر، المساحة، الحالة)
  double? minPrice, maxPrice, minSize, maxSize;
  String? condition;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // 🔹 فتح نافذة الفلترة المستقلة
  void _openFilter() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        initialPrice: RangeValues(minPrice ?? 0, maxPrice ?? 500000),
        initialSize: RangeValues(minSize ?? 0, maxSize ?? 1000),
        initialCondition: condition ?? "all",
      ),
    );

    if (result != null) {
      setState(() {
        minPrice = result['min_price'];
        maxPrice = result['max_price'];
        minSize = result['min_size'];
        maxSize = result['max_size'];
        condition = result['condition'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 1. مراقبة اسم المنطقة المختارة من الـ Provider التلقائي
    // بمجرد تغيير القيمة في AreaSearchAutocomplete سيتم إعادة بناء الشاشة
    final selectedAreaName = ref.watch(selectedAreaNameProvider);

    // 🔹 2. تحضير الـ Params مع تضمين الـ areaName المختار
    final params = SubCategoryParams(
      categoryId: widget.catId,
      areaName: selectedAreaName, // القيمة القادمة من Autocomplete
      minPrice: minPrice,
      maxPrice: maxPrice,
      minSize: minSize,
      maxSize: maxSize,
      status: (condition == "all" || condition == null) ? null : condition,
    );

    final subCategoriesAsync = ref.watch(subCategoryProvider(params));

    return BaseScaffold(
      title: widget.catName,
      actions: [
        // زر لمسح فلتر المنطقة إذا كان مفعلاً
        if (selectedAreaName != null)
          IconButton(
            onPressed: () => ref.read(selectedAreaNameProvider.notifier).state = null,
            icon: const Icon(Icons.location_off, color: Colors.white),
            tooltip: "مسح تصفية المنطقة",
          ),
        IconButton(
          onPressed: _openFilter,
          icon: const Icon(Icons.tune_rounded, color: Colors.white),
        ),
      ],
      body: subCategoriesAsync.when(
        data: (categories) => _buildBody(categories, selectedAreaName),
        loading: () => _buildLoadingState(),
        error: (error, stack) => _buildErrorWidget(error, params),
      ),
      bottomNavigationBar: subCategoriesAsync.maybeWhen(
        data: (categories) => _buildFixedMapButton(),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  // --- بناء الجسم الرئيسي ---
  Widget _buildBody(List<SubCategoryItem> categories, String? activeArea) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      children: [
        // 🔹 حقل البحث التلقائي (Autocomplete)
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AreaSearchAutocomplete(),
        ),

        // تنبيه للمستخدم عند تفعيل فلتر المنطقة
        if (activeArea != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: CustomText(
              "عرض النتائج في: $activeArea",
              color: context.color.territoryColor,
              fontWeight: FontWeight.bold,
              fontSize: context.font.small,
            ),
          ),

        _buildAllInHeader(),
        const SizedBox(height: 16),
        _buildCategoryList(categories),
      ],
    );
  }

  Widget _buildAllInHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.color.secondaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
          ],
        ),
        alignment: Alignment.centerRight,
        child: CustomText(
          "عرض الكل في قسم ${widget.catName}",
          fontWeight: FontWeight.w500,
          color: context.color.territoryColor,
        ),
      ),
    );
  }

  Widget _buildCategoryList(List<SubCategoryItem> categories) {
    if (categories.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Icon(Icons.search_off_rounded, size: 60, color: Colors.grey[400]),
              const SizedBox(height: 16),
              const CustomText("لا توجد نتائج تطابق الفلاتر المختارة", color: Colors.grey),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _buildItemCard(categories[index]),
    );
  }

  Widget _buildItemCard(SubCategoryItem item) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AdDetailsScreen(model: item))),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.color.secondaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: 90, height: 90,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: UiUtils.imageType(item.image ?? "", fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(item.name ?? "", fontWeight: FontWeight.w600, fontSize: context.font.large, maxLines: 1),
                  const SizedBox(height: 4),
                  CustomText("\$${item.price?.toInt() ?? '---'}", color: context.color.territoryColor, fontWeight: FontWeight.bold),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.straighten, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      CustomText("${item.size?.toInt() ?? '--'} م²", fontSize: 12),
                      const SizedBox(width: 10),
                      Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Expanded(child: CustomText(item.city ?? item.state ?? "", fontSize: 12, maxLines: 1)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedMapButton() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: MediaQuery.paddingOf(context).bottom + 12),
      decoration: BoxDecoration(
        color: context.color.backgroundColor,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -4))],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.color.territoryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          icon: const Icon(Icons.map, color: Colors.white),
          label: const CustomText("عرض على الخريطة", color: Colors.white, fontWeight: FontWeight.w600),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MapViewScreen(
                catId: widget.catId,
                catName: widget.catName,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() => const Center(child: Padding(
    padding: EdgeInsets.all(20.0),
    child: CircularProgressIndicator(),
  ));

  Widget _buildErrorWidget(Object error, SubCategoryParams params) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText("حدث خطأ أثناء تحميل البيانات", color: Colors.red),
          TextButton(
              onPressed: () => ref.refresh(subCategoryProvider(params)),
              child: const Text("إعادة المحاولة")
          )
        ],
      )
  );
}