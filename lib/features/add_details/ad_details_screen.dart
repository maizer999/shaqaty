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
    if (widget.model?.image?.isNotEmpty ?? false) {
      images.add(widget.model!.image!);
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
      title:  "add_details".tr(),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Image
          if (images.isNotEmpty)
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                    AppCachedImage(
                      imageUrl: images[index] ?? '',
                      borderRadius: BorderRadius.circular(12),
                    ),


                  );
                },
              ),
            ),

          const SizedBox(height: 16),

          // Title
          Text(
            item.name ?? '',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Price
          if (item.price != null)
            Text(
              '\$${item.price}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),

          const SizedBox(height: 6),

          // Location
          if (item.city != null || item.state != null || item.country != null)
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  [
                    item.city,
                    item.state,
                    item.country,
                  ].where((e) => e != null && e.isNotEmpty).join(', '),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

          const Divider(height: 32),

          // Description
          if (item.description?.isNotEmpty ?? false) ...[
            CustomText(
              "descriptionLbl".tr(),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 8),
            CustomText(
              item.description!,


              overflow: TextOverflow.visible,
              softWrap: true,
            )

          ],
        ],
      ),
    );
  }
}
