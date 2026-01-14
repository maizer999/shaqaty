import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:flutter_core/features/addAds/views/widgets/build_gradiView.dart';
import 'package:flutter_core/features/common/base_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/common_button_widget.dart';
import 'add_item_form.dart';

class AddItemImageView extends ConsumerWidget {
  final double latitude;
  final double longitude;


  AddItemImageView({super.key ,  required this.latitude, required this.longitude,});

  final ValueNotifier<List<File>> imagesNotifier = ValueNotifier([]);

  // Pick multiple images
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      imagesNotifier.value = [
        ...imagesNotifier.value,
        ...pickedFiles.map((x) => File(x.path)),
      ];
    }
  }

  // Navigate to form screen with selected images
  void _goToFormScreen(BuildContext context) {
    if (imagesNotifier.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء اختيار صورة واحدة على الأقل")),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddItemFormScreen(images: imagesNotifier.value),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizes.height30,
                ValueListenableBuilder<List<File>>(
                  valueListenable: imagesNotifier,
                  builder: (context, images, _) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                        image: images.isNotEmpty
                            ? DecorationImage(
                          image: FileImage(images.first),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: images.isEmpty
                          ?
                        Center(
                          child: GestureDetector(
                            onTap: () => _pickImage(),
                            child: Text(
                              'اضغط لإضافة الصورة الرئيسية',
                              style: GoogleFonts.balooThambi2(
                                fontSize: 18,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        )
                          : null,
                    );
                  },
                ),
                AppSizes.height20,

                // Image grid
                Expanded(
                  child: ValueListenableBuilder<List<File>>(
                    valueListenable: imagesNotifier,
                    builder: (context, images, _) {
                      if (images.isEmpty) {
                        return const Center(
                          child: CustomText(
                            'الرجاء إضافة صورة على الأقل',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }

                      return BuildGradViewComponent(
                        galleryData: images,
                        onRemove: (index) {
                          imagesNotifier.value = [
                            ...imagesNotifier.value..removeAt(index)
                          ];
                        },
                        onTap: (index) {
                          final selected = images[index];
                          imagesNotifier.value = [
                            selected,
                            ...images.where((e) => e != selected),
                          ];
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Pick image button
                CommonButtonWidget(
                  fontColor: Colors.white,
                  text: 'اضافة صور',
                  onTap: () => _pickImage(), // ✅ correct
                ),
              ],
            ),
          ),
        ),
      ),

      // Next button to go to form screen
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child:

        CommonButtonWidget(
          fontColor: Colors.white,
          text: 'التالي ',
          onTap: () { _goToFormScreen(context) ; },)
      ),
    );
  }
}
