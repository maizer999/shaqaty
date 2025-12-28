import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../build_context.dart';
import '../../../core/theme/theme.dart';
import '../../../core/theme/ui_utils.dart';
import '../../../core/utils/shimmer_loading.dart';
import '../../../core/widgets/custom_text.dart';
import '../../add_details/ad_details_screen.dart';
import '../controllers/sub_category_provider.dart';
import '../models/sub_category_response.dart';

class SubCategoryScreen extends ConsumerStatefulWidget {
  final String catName;
  final int catId;
  final List<String> categoryIds;

  const SubCategoryScreen({
    super.key,
    required this.catName,
    required this.catId,
    required this.categoryIds,
  });

  @override
  ConsumerState<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends ConsumerState<SubCategoryScreen> {
  late final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final params = SubCategoryParams(categoryId: widget.catId);
    final subCategoriesAsync = ref.watch(subCategoryProvider(params));

    return Scaffold(
      backgroundColor: context.color.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: CustomText(
          widget.catName,
          maxLines: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: subCategoriesAsync.when(
        data: (categories) => _buildBody(categories),
        loading: () => ShimmerLoading(
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        error: (error, stack) => _buildErrorWidget(error, params),
      ),
    );
  }

  Widget _buildBody(List<SubCategoryItem> categories) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.only(
        top: 12,
        bottom: MediaQuery.paddingOf(context).bottom + 16,
      ),
      children: [
        _buildAllInHeader(),
        const SizedBox(height: 16),
        _buildCategoryList(categories),
      ],
    );
  }

  Widget _buildAllInHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: context.color.secondaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          alignment: Alignment.centerLeft,
          child: CustomText(
            "All in ${widget.catName}",
            fontWeight: FontWeight.w700,
            fontSize: context.font.normal,
            color: context.color.territoryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(List<SubCategoryItem> categories) {
    if (categories.isEmpty) return const Center(child: Text("No items found"));

    return ListView.separated(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final category = categories[index];
        final hasSubtitle = (category.description?.isNotEmpty ?? false);

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.color.secondaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // print data
              debugPrint('Category tapped: ${category.name}');
              debugPrint('Category id: ${category.id}');

              // navigation
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdDetailsScreen(model: category,),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: context.color.territoryColor.withOpacity(0.1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: UiUtils.imageType(
                      category.image ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        category.name ?? "",
                        fontWeight: FontWeight.w600,
                        fontSize: context.font.large,
                        maxLines: 2,
                      ),
                      if (hasSubtitle)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: CustomText(
                            category.description ?? "",
                            fontSize: 16,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            color: context.color.territoryColor.withOpacity(0.7),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.color.backgroundColor,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: context.color.territoryColor,
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: [
        const SizedBox(height: 12),
        _shimmerEffect(height: 60),
        const SizedBox(height: 16),
        Expanded(child: _shimmerEffect(height: 90)),
      ],
    );
  }

  Widget _shimmerEffect({required double height}) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.shimmerBaseColor,
      highlightColor: Theme.of(context).colorScheme.shimmerHighlightColor,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, __) => Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(Object error, SubCategoryParams params) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          const CustomText("Failed to load categories"),
          TextButton(
            onPressed: () => ref.invalidate(subCategoryProvider(params)),
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }
}
