import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/theme/ui_utils.dart';
import '../models/sub_category_response.dart';
import '../../add_details/ad_details_screen.dart';
import '../../common/base_scaffold.dart';

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

    return BaseScaffold(
      title: "عرض على الخريطة",
      body: Stack(
        children: [
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

          if (_selectedItem != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                      textDirection: TextDirection.rtl, // ليكون الترتيب من اليمين لليسار
                      children: [
                        // الصورة (ستكون في اليمين)
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

                        // العمود الذي يحتوي على النصوص والزر
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 🔹 سطر العنوان والإغلاق
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // يوزع العناصر على الطرفين
                                textDirection: TextDirection.rtl, // يضمن أن العنوان يمين والزر يسار
                                children: [
                                  // العنوان (في اليمين)
                                  Expanded(
                                    child: CustomText(
                                      _selectedItem!.name ?? "",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      maxLines: 1,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),

                                  // زر الإغلاق (في اليسار تماماً)
                                  InkWell(
                                    onTap: () => setState(() => _selectedItem = null),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[100],
                                      ),
                                      child: const Icon(Icons.close, size: 16, color: Colors.black54),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              // الوصف
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

                              // السعر
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
                ),
              ),
            ),
        ],
      ),
    );
  }
}