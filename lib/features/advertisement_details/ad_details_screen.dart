import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import '../../core/network/app_cached_image.dart';
import '../common/base_scaffold.dart';
import '../sub_category/models/sub_category_response.dart';
import 'package:easy_localization/easy_localization.dart';

class AdDetailsScreen extends StatefulWidget {
  final SubCategoryItem? model;

  const AdDetailsScreen({super.key, this.model});

  @override
  State<AdDetailsScreen> createState() => _AdDetailsScreenState();
}

class _AdDetailsScreenState extends State<AdDetailsScreen> {
  final List<String> images = [];

  @override
  void initState() {
    super.initState();
    _prepareImages();
  }

  void _prepareImages() {
    // إضافة الصورة الرئيسية
    if (widget.model?.image?.isNotEmpty ?? false) {
      images.add(widget.model!.image!);
    }
    // إضافة صور المعرض إذا وجدت
    if (widget.model?.galleryImages != null) {
      for (var img in widget.model!.galleryImages!) {
        if (img is Map && img.containsKey('image')) {
          images.add(img['image']);
        } else if (img is String) {
          images.add(img);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.model;

    if (item == null) {
      return const Scaffold(
        body: Center(child: Text("No Data Available")),
      );
    }

    return BaseScaffold(
      title: "addDetails".tr(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- قسم الصور ---
          if (images.isNotEmpty)
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AppCachedImage(
                          imageUrl: images[index],
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    },
                  ),
                ),
                if (images.length > 1)
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "1 / ${images.length}",
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),

          const SizedBox(height: 20),

          // --- العنوان والموقع ---
          Text(
            item.name ?? '',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: Colors.blueGrey[400]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  "${item.city ?? ''}, ${item.country ?? ''}",
                  style: TextStyle(color: Colors.blueGrey[400], fontSize: 14),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // --- الصف الجديد: المساحة، المالك، السعر ---
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              border: Border.all(color: Colors.grey[100]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // المساحة
                _buildFeatureItem(
                  Icons.straighten_rounded,
                  "sizeLbl".tr(),
                  item.size != null ? "${item.size!.toInt()} m²" : "---",
                  Colors.blue,
                ),
                // نوع المعلن
                _buildFeatureItem(
                  Icons.person_outline_rounded,
                  "ownerLbl".tr(),
                  _getAdvertiserType(item.advertiserType),
                  Colors.orange,
                ),
                // السعر
                _buildFeatureItem(
                  Icons.payments_outlined,
                  "priceLbl".tr(),
                  item.price != null ? "\$${item.price!.toInt()}" : "---",
                  Colors.green,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // --- قسم الوصف ---
          if (item.description?.isNotEmpty ?? false) ...[
            CustomText(
              "descriptionLbl".tr(),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomText(
                item.description!,
                fontSize: 15,
                color: Colors.black87,
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
            ),
          ],

          const SizedBox(height: 100), // مساحة إضافية للتمرير
        ],
      ),
    );
  }

  // دالة لتحديد نص المعلن
  String _getAdvertiserType(String? type) {
    if (type == "1") return "owner".tr();
    if (type == "0") return "agent".tr();
    return "unknown".tr();
  }

  // ويدجت بناء العناصر (Feature Item)
  Widget _buildFeatureItem(IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.blueGrey[300], fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }
}