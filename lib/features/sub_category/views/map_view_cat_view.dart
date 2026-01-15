import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/theme/ui_utils.dart';
import '../models/sub_category_response.dart';
import '../../add_details/ad_details_screen.dart';

class MapViewScreen extends StatefulWidget {
  final List<SubCategoryItem> categories;

  const MapViewScreen({super.key, required this.categories});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  GoogleMapController? _mapController;
  SubCategoryItem? _selectedItem;

  @override
  Widget build(BuildContext context) {
    // 🔹 Markers
    Set<Marker> markers = widget.categories.map((item) {
      return Marker(
        markerId: MarkerId(item.id.toString()),
        position: LatLng(
          item.latitude ?? 31.963158,
          item.longitude ?? 35.930359,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() => _selectedItem = item);
        },
      );
    }).toSet();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map View"),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          // 🔹 الخريطة
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.categories.isNotEmpty
                  ? LatLng(
                widget.categories.first.latitude ?? 31.963158,
                widget.categories.first.longitude ?? 35.930359,
              )
                  : const LatLng(31.963158, 35.930359),
              zoom: 14,
            ),
            markers: markers,
            onMapCreated: (controller) => _mapController = controller,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),

          // 🔹 Info Box أسفل الشاشة
          if (_selectedItem != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AdDetailsScreen(model: _selectedItem!),
                      ),
                    );
                  },
                  child: Container(
                    height: 180, // ارتفاع ثابت
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // 🔹 صورة العنصر
                        Container(
                          width: 100,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: UiUtils.imageType(
                              _selectedItem!.image ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // 🔹 نصوص العنصر
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                _selectedItem!.name ?? "",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                maxLines: 2,
                              ),
                              const SizedBox(height: 4),
                              CustomText(
                                _selectedItem!.description ?? "",
                                fontSize: 14,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey[700],
                              ),
                              const SizedBox(height: 8),
                              if ((_selectedItem!.price ?? 0) > 0)
                                CustomText(
                                  "\$${_selectedItem!.price?.toStringAsFixed(2)}",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.teal,
                                ),
                            ],
                          ),
                        ),
                        // 🔹 زر الإغلاق
                        InkWell(
                          onTap: () => setState(() => _selectedItem = null),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: const Icon(Icons.close, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
