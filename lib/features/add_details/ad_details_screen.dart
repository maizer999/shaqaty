import 'package:flutter/material.dart';
import '../home/data/item_model.dart'; // Adjust path

class AdDetailsScreen extends StatefulWidget {
  final ItemModel? model;

  const AdDetailsScreen({super.key, this.model});

  @override
  State<AdDetailsScreen> createState() => _AdDetailsScreenState();
}

class _AdDetailsScreenState extends State<AdDetailsScreen> {
  int _currentPage = 0;
  final List<String?> images = [];

  @override
  void initState() {
    super.initState();
    _prepareImages();
  }

  void _prepareImages() {
    if (widget.model != null) {
      images.add(widget.model!.image);
      images.addAll(widget.model!.galleryImages?.map((e) => e.image) ?? []);
      if (widget.model!.videoLink?.isNotEmpty ?? false) images.add(widget.model!.videoLink);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.model;

    if (item == null) {
      return const Scaffold(body: Center(child: Text("No Data Available")));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.translatedName ?? "Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => {} //HelperUtils.shareItem(context, "ad", item.slug!),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Image Section
          SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: images.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) => Image.network(images[index]!, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 16),

          // Basic Info
          Text(item.translatedName ?? '', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('\$${item.price}', style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              Text(item.translatedAddress ?? '', style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Divider(height: 32),

          // Custom Fields Section
          const Text("Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildCustomFieldsGrid(item),

          const Divider(height: 32),

          // Description
          const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(item.description ?? ''),
        ],
      ),
    );
  }

  Widget _buildCustomFieldsGrid(ItemModel item) {
    final fields = item.allTranslatedCustomFields ?? [];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 50,
      ),
      itemCount: fields.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fields[index].name ?? '', style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(fields[index].value ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        );
      },
    );
  }
}