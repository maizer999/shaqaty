import 'package:flutter/material.dart';
import 'package:flutter_core/features/sub_category/views/widgets/filter_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/theme/ui_utils.dart';
import '../../../core/widgets/custom_text.dart';
import '../../advertisement_details/ad_details_screen.dart';
import '../models/sub_category_response.dart';
import '../controllers/sub_category_provider.dart';
import '../../common/base_scaffold.dart';

class MapViewScreen extends ConsumerStatefulWidget {
  final int catId;
  final String catName;

  const MapViewScreen({super.key, required this.catId, required this.catName});

  @override
  ConsumerState<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends ConsumerState<MapViewScreen> {
  GoogleMapController? _mapController;
  SubCategoryItem? _selectedItem;

  // Filter variables
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

    // Bottom padding to avoid map controls
    final bottomPadding = MediaQuery.of(context).padding.bottom + 70;

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

        // Positioned card above map controls
        if (_selectedItem != null)
          Positioned(
            bottom: bottomPadding,
            left: 16,
            right: 16,
            child: _buildSelectedCard(),
          ),
      ],
    );
  }

  Widget _buildSelectedCard() {
    if (_selectedItem == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AdDetailsScreen(model: _selectedItem!),
          ),
        );
      },
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            // Image
            Container(
              width: 100,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: UiUtils.imageType(
                  _selectedItem!.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Close
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                        child: CustomText(
                          _selectedItem!.name ?? "",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          maxLines: 1,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() => _selectedItem = null),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Description
                  Expanded(
                    child: CustomText(
                      _selectedItem!.description ?? "",
                      fontSize: 13,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey[600],
                      textAlign: TextAlign.right,
                    ),
                  ),

                  // Price
                  if ((_selectedItem!.price ?? 0) > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: CustomText(
                        "${_selectedItem!.price?.toStringAsFixed(2)} \$",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.teal,
                        textAlign: TextAlign.right,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
