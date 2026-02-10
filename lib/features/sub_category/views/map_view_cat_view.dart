import 'package:flutter/material.dart';
import 'package:flutter_core/features/sub_category/views/sub_category_screen.dart';
import 'package:flutter_core/features/sub_category/views/widgets/filter_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/sub_category_response.dart';
import '../controllers/sub_category_provider.dart'; // أضف هذا
import '../../add_details/ad_details_screen.dart';
import '../../common/base_scaffold.dart';

class MapViewScreen extends ConsumerStatefulWidget { // حوله إلى Consumer
  final int catId; // مرر الـ ID بدلاً من القائمة فقط لتتمكن من إعادة الطلب
  final String catName;

  const MapViewScreen({super.key, required this.catId, required this.catName});

  @override
  ConsumerState<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends ConsumerState<MapViewScreen> {
  GoogleMapController? _mapController;
  SubCategoryItem? _selectedItem;

  // متغيرات الفلتر
  double? minPrice, maxPrice, minSize, maxSize;
  String? condition;

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
    // جلب البيانات بناءً على الفلاتر الحالية
    final params = SubCategoryParams(
      categoryId: widget.catId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minSize: minSize,
      maxSize: maxSize,
      status: (condition == "all" || condition == null) ? null : condition,
    );

    final adsAsync = ref.watch(subCategoryProvider(params));

    return BaseScaffold(
      title: "خريطة ${widget.catName}",
      actions: [
        IconButton(
          onPressed: _openFilter,
          icon: const Icon(Icons.tune_rounded, color: Colors.white),
        ),
      ],
      body: adsAsync.when(
        data: (items) => _buildMap(items),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text("Error: $e")),
      ),
    );
  }

  Widget _buildMap(List<SubCategoryItem> items) {
    Set<Marker> markers = items.map((item) {
      return Marker(
        markerId: MarkerId(item.id.toString()),
        position: LatLng(item.latitude ?? 31.963158, item.longitude ?? 35.930359),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () => setState(() => _selectedItem = item),
      );
    }).toSet();

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: items.isNotEmpty
                ? LatLng(items.first.latitude!, items.first.longitude!)
                : const LatLng(31.963158, 35.930359),
            zoom: 12,
          ),
          markers: markers,
          onMapCreated: (c) => _mapController = c,
          myLocationEnabled: true,
        ),
        if (_selectedItem != null) _buildSelectedCard(),
      ],
    );
  }

  // الـ Card الخاص بالعقار المختار (نفس الكود السابق الخاص بك)
  Widget _buildSelectedCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AdDetailsScreen(model: _selectedItem!))),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 5))],
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                // ... باقي تفاصيل الكارد كما هي في كودك الأصلي ...
                // لا تنسى زر الإغلاق:
                // InkWell(onTap: () => setState(() => _selectedItem = null), child: ...)
              ],
            ),
          ),
        ),
      ),
    );
  }
}