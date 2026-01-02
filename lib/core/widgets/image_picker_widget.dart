import 'dart:io';
import 'dart:ui' as BorderType;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? pickedImage;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;
  final String? imageUrl;

  const ImagePickerWidget({
    super.key,
    this.pickedImage,
    required this.onPickImage,
    required this.onRemoveImage,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (pickedImage != null) {
      content = Image.file(pickedImage!, fit: BoxFit.cover);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      content = Image.network(imageUrl!, fit: BoxFit.cover);
    } else {
      content = Center(child: Text("Add Image"));
    }

    return Stack(
      children: [
        GestureDetector(
          onTap: onPickImage,
          child: Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: pickedImage == null && (imageUrl == null || imageUrl!.isEmpty)
                ? DottedBorder(
                    // color: Colors.grey,
                    // borderType: BorderType.RRect,
                    // radius: Radius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Add Image"),
                    ),
                  )
                : content,
          ),
        ),
        if (pickedImage != null || (imageUrl != null && imageUrl!.isNotEmpty))
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onRemoveImage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
      ],
    );
  }
}
