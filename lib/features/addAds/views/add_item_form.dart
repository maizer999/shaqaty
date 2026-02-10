import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/core/theme/theme.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';
import '../../common/base_scaffold.dart';
import '../../home/views/home_screen.dart';
import '../providers/add_item_data_notifier.dart';
import '../providers/item_provider.dart';

class AddItemFormScreen extends ConsumerStatefulWidget {
  final List<File> images;
  final double latitude;
  final double longitude;

  const AddItemFormScreen({
    super.key,
    required this.images,
    this.latitude = 31.963158,
    this.longitude = 35.930359,
  });

  @override
  ConsumerState<AddItemFormScreen> createState() => _AddItemFormScreenState();
}

class _AddItemFormScreenState extends ConsumerState<AddItemFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // المتحكمات الأساسية
  final TextEditingController _nameController = TextEditingController(text: "منتج تجريبي");
  final TextEditingController _descController = TextEditingController(text: "وصف تجريبي");
  final TextEditingController _priceController = TextEditingController(text: "100");
  final TextEditingController _contactController = TextEditingController(text: "0799999999");
  final TextEditingController _videoController = TextEditingController(text: "https://youtube.com/example");

  // الحقول الجديدة المطلوبة
  final TextEditingController _areaController = TextEditingController(); // المساحة
  final TextEditingController _buildingAgeController = TextEditingController(); // عمر البناء
  bool _isFurnished = false; // مفروش أو لا

  // متحكمات الموقع
  final TextEditingController _addressController = TextEditingController(text: "شارع تجريبي، مبنى 1");
  final TextEditingController _countryController = TextEditingController(text: "الأردن");
  final TextEditingController _cityController = TextEditingController(text: "عمان");
  final TextEditingController _stateController = TextEditingController(text: "جاردنز");

  bool _isLoading = false;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (widget.images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء رفع صورة واحدة على الأقل")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final notifier = ref.read(addItemDataProvider.notifier);

      // تحديث البيانات في الـ Provider
      notifier.setName(_nameController.text);
      notifier.setDescription(_descController.text);
      notifier.setCategoryId("2");
      notifier.setAllCategoryIds("2");
      notifier.setPrice(_priceController.text);
      notifier.setContact(_contactController.text);
      notifier.setVideoLink(_videoController.text);

      // ✅ إرسال الحقول الجديدة للـ Provider
      // ملاحظة: تأكد من إضافة هذه الدوال في ملف addItemDataProvider
      // notifier.setArea(_areaController.text);
      // notifier.setBuildingAge(_buildingAgeController.text);
      // notifier.setIsFurnished(_isFurnished ? "1" : "0");

      notifier.setAddress(_addressController.text);
      notifier.setCountry(_countryController.text);
      notifier.setCity(_cityController.text);
      notifier.setStateName(_stateController.text);
      notifier.setLatitude(widget.latitude.toString());
      notifier.setLongitude(widget.longitude.toString());
      notifier.setShowOnlyToPremium("1");
      notifier.addImages(widget.images);

      final state = ref.read(addItemDataProvider);

      // عملية الإرسال عبر الـ Repository
      final result = await ref.read(itemRepositoryProvider).addItem(
        name: state.name ?? "",
        description: state.description ?? "",
        categoryId: state.categoryId ?? "",
        allCategoryIds: state.allCategoryIds ?? "",
        price: state.price ?? "",
        contact: state.contact ?? "",
        videoLink: state.videoLink ?? "",
        address: state.address ?? "",
        latitude: state.latitude ?? "",
        longitude: state.longitude ?? "",
        country: state.country ?? "",
        city: state.city ?? "",
        state: state.state ?? "",
        showOnlyToPremium: state.showOnlyToPremium ?? "1",
        galleryImages: state.images,
        // ✅ تمرير القيم الجديدة للـ API (إذا كان الـ Repository يدعمها)
        // area: _areaController.text,
        // buildingAge: _buildingAgeController.text,
        // furnished: _isFurnished ? "1" : "0",
      );

      result.when(
            (response) {
          _showSuccessDialog(
            "تم ارسال الاعلان بنجاح",
            context,
            onConfirmed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
              );
            },
          );
        },
            (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("حدث خطأ: $error")),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("فشل الإرسال: $e")),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "تفاصيل الإعلان",
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    const SizedBox(height: 10),
                    _sectionTitle("المعلومات الأساسية"),
                    _inputLabel("الاسم"),
                    _textInput(_nameController, "أدخل الاسم هنا", (v) => v!.isEmpty ? "الرجاء إدخال الاسم" : null),

                    _inputLabel("الوصف"),
                    _textInput(_descController, "وصف المختصر", (v) => v!.isEmpty ? "الرجاء إدخال الوصف" : null),

                    _inputLabel("السعر"),
                    _textInput(_priceController, "0.00", (v) => v!.isEmpty ? "الرجاء تحديد السعر" : null, TextInputType.number),

                    const Divider(height: 40),
                    _sectionTitle("تفاصيل البناء والعقار"),

                    _inputLabel("المساحة (م²)"),
                    _textInput(_areaController, "أدخل المساحة", (v) => v!.isEmpty ? "المساحة مطلوبة" : null, TextInputType.number),

                    _inputLabel("عمر البناء"),
                    _textInput(_buildingAgeController, "مثال: جديد، 5 سنوات...", (v) => v!.isEmpty ? "عمر البناء مطلوب" : null),

                    // حقل مفروش / غير مفروش
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: context.color.shimmerHighlightColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SwitchListTile(
                        title: Text("هل العقار مفروش؟", style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w700)),
                        value: _isFurnished,
                        activeColor: context.color.territoryColor,
                        onChanged: (val) => setState(() => _isFurnished = val),
                      ),
                    ),

                    const Divider(height: 40),
                    _sectionTitle("بيانات التواصل والوسائط"),
                    _inputLabel("رقم التواصل"),
                    _textInput(_contactController, "07XXXXXXXX", (v) => v!.isEmpty ? "رقم الهاتف مطلوب" : null, TextInputType.phone),

                    _inputLabel("رابط الفيديو (اختياري)"),
                    _textInput(_videoController, "https://youtube.com/...", null),

                    const Divider(height: 40),
                    _sectionTitle("الموقع الجغرافي"),
                    _inputLabel("الدولة"),
                    _textInput(_countryController, "الأردن", (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null),
                    _inputLabel("المدينة"),
                    _textInput(_cityController, "عمان", (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null),
                    _inputLabel("المنطقة / الولاية"),
                    _textInput(_stateController, "جاردنز", (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null),
                    _inputLabel("العنوان التفصيلي"),
                    _textInput(_addressController, "اسم الشارع، المبنى...", (v) => v!.isEmpty ? "العنوان مطلوب" : null),
                  ],
                ),
              ),

              // زر الإرسال
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.color.territoryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const CustomText(
                      color: Colors.white,
                      "إرسال البيانات",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت لعنوان الأقسام
  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Text(
      title,
      style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );

  Widget _inputLabel(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
    child: Text(
      label,
      style: GoogleFonts.cairo(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w700),
    ),
  );

  Widget _textInput(TextEditingController controller, String hint, String? Function(String?)? validator,
      [TextInputType type = TextInputType.text]) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: type,
          textAlign: TextAlign.right,
          style: GoogleFonts.cairo(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.cairo(fontSize: 13, color: Colors.grey),
            errorStyle: GoogleFonts.cairo(color: Colors.red, height: 0.8),
            filled: true,
            fillColor: context.color.shimmerHighlightColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      );
}

// ✅ Dialog النجاح
void _showSuccessDialog(String message, BuildContext context, {VoidCallback? onConfirmed}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Center(child: Icon(Icons.check_circle, color: Colors.green, size: 60)),
          content: Text(message, textAlign: TextAlign.center, style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
          actions: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onConfirmed != null) onConfirmed();
                },
                child: Text("تم", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
              ),
            ),
          ],
        ),
      );
    },
  );
}