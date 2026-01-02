import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/ui_utils.dart';
import '../../../core/utils/blurred_dialog_box.dart';
import '../../../core/widgets/constant.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/image_picker.dart';
import '../../common/base_scaffold.dart';
import '../../home/data/item_model.dart';
import '../../home/data/models/category_response.dart';
import '../widgets/image_adapter.dart';
import 'package:easy_localization/easy_localization.dart';


class AddItemDetails extends ConsumerStatefulWidget {
  final List<CategoryItem>? breadCrumbItems;
  final bool? isEdit;

  const AddItemDetails({super.key, this.breadCrumbItems, this.isEdit});

  static Route route(RouteSettings settings) {
    Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
    return MaterialPageRoute(
      builder: (context) => AddItemDetails(
        breadCrumbItems: arguments?['breadCrumbItems'],
        isEdit: arguments?['isEdit'],
      ),
    );
  }

  @override
  ConsumerState<AddItemDetails> createState() => _AddItemDetailsState();
}

class _AddItemDetailsState extends ConsumerState<AddItemDetails> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PickImage _pickTitleImage = PickImage();
  final PickImage itemImagePicker = PickImage();

  String titleImageURL = "";
  List<dynamic> mixedItemImageList = [];
  List<int> deleteItemImageList = [];

  // Controllers
  final TextEditingController adSlugController = TextEditingController();
  final TextEditingController adPriceController = TextEditingController();
  final TextEditingController adPhoneNumberController = TextEditingController();
  final TextEditingController adAdditionalDetailsController = TextEditingController();
  final TextEditingController minSalaryController = TextEditingController();
  final TextEditingController maxSalaryController = TextEditingController();

  Map<String, TextEditingController> adTitleControllers = {};
  Map<String, TextEditingController> adDescriptionControllers = {};

  int selectedLangIndex = 0;
  TabController? _tabController;
  late List selectedCategoryList;
  ItemModel? item;
  bool _translationsPopulated = false;
  final ValueNotifier<bool> _isValid = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _initData();
    });

    _pickTitleImage.listener((p0) {
      if (mounted) setState(() => titleImageURL = "");
    });

    itemImagePicker.listener((images) {
      if (mounted) setState(() => mixedItemImageList.addAll(List<dynamic>.from(images)));
    });
  }

  void _initData() {
    if (widget.isEdit ?? false) {
      // item = getCloudData('edit_request') as ItemModel;
      // ref.read(fetchCustomFieldsProvider.notifier).fetchCustomFields(categoryIds: item!.allCategoryIds!);

      // Populate Edit Data
      adSlugController.text = item?.slug ?? "";
      adPriceController.text = item?.price?.toString() ?? "";
      adPhoneNumberController.text = item?.contact ?? "";
      adAdditionalDetailsController.text = item?.videoLink ?? "";
      titleImageURL = item?.image ?? "";
      mixedItemImageList.addAll(item?.galleryImages?.map((e) => e.image).toList() ?? []);
    } else {
      List<int> ids = widget.breadCrumbItems!.map((item) => item.id!).toList();
      selectedCategoryList = ids;
      // ref.read(fetchCustomFieldsProvider.notifier).fetchCustomFields(categoryIds: ids.join(','));
      // adPhoneNumberController.text = HiveUtils.getUserDetails().mobile ?? "";
    }
  }

  @override
  void dispose() {
    adSlugController.dispose();
    adPriceController.dispose();
    adPhoneNumberController.dispose();
    adAdditionalDetailsController.dispose();
    minSalaryController.dispose();
    maxSalaryController.dispose();
    _tabController?.dispose();
    _isValid.dispose();
    for (var c in adTitleControllers.values) c.dispose();
    for (var c in adDescriptionControllers.values) c.dispose();
    super.dispose();
  }

  String _generateSlug(String title) {
    return title.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'^-+|-+$'), '');
  }

  bool _isJobCategory() {
    return (widget.isEdit ?? false)
        ? item!.category!.isJobCategory == 1
        : widget.breadCrumbItems?.first.isJobCategory == 1;
  }

  @override
  Widget build(BuildContext context) {



    return AnnotatedSafeArea(
      child: BaseScaffold(
        title: "statusCancelled".tr(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                const SizedBox(height: 16),
                _buildBreadcrumbs(),

                const SizedBox(height: 18),
                _buildTitleAndDescription("ar" , "ar" , true),
                const SizedBox(height: 20),
                _buildImageSection(),

                const SizedBox(height: 20),
                _buildPriceSection(),

                const SizedBox(height: 15),
                _buildContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // --- UI HELPER WIDGETS ---

  void _initializeTabs(List languages, String defaultLangCode) {
    if (languages.isEmpty) return;
    _tabController ??= TabController(length: languages.length, vsync: this);
    for (var lang in languages) {
      adTitleControllers[lang['code']] ??= TextEditingController();
      adDescriptionControllers[lang['code']] ??= TextEditingController();
    }
  }



  Widget _buildTitleAndDescription(String langCode, String langName, bool isDefault) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText("${"adTitle".tr} ($langName)"),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: adTitleControllers[langCode],
          validator: isDefault ? CustomTextFieldValidator.nullCheck : null,
          onChange: (v) { if(isDefault) adSlugController.text = _generateSlug(v); },
          hintText: "adTitleHere".tr(),
        ),
        const SizedBox(height: 15),
        CustomText("${"descriptionLbl".tr()} ($langName)"),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: adDescriptionControllers[langCode],
          validator: isDefault ? CustomTextFieldValidator.nullCheck : null,
          maxLine: 5,
          hintText: "writeSomething".tr(),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText("mainPicture".tr()),
        const SizedBox(height: 10),
        _titleImageWidget(),
        const SizedBox(height: 15),
        CustomText("otherPictures".tr()),
        const SizedBox(height: 10),
        _multiImageWidget(),
      ],
    );
  }

  Widget _titleImageWidget() {
    return InkWell(
      onTap: () => _pickTitleImage.pick( context: context),
      child: DottedBorder(

        child: Container(
          width: 100, height: 100,
          child: _pickTitleImage.pickedFile != null
              ? Image.file(_pickTitleImage.pickedFile!, fit: BoxFit.cover)
              : (titleImageURL.isNotEmpty ? Image.network(titleImageURL, fit: BoxFit.cover) : const Icon(Icons.add_a_photo)),
        ),
      ),
    );
  }

  Widget _multiImageWidget() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mixedItemImageList.length + 1,
        itemBuilder: (context, index) {
          if (index == mixedItemImageList.length) {
            return InkWell(
              onTap: () => itemImagePicker.pick(pickMultiple: true, context: context),
              child: DottedBorder(child: Container(width: 100, height: 100, child: const Icon(Icons.add))),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ImageAdapter(image: mixedItemImageList[index]),
          );
        },
      ),
    );
  }

  Widget _buildPriceSection() {
    if (_isJobCategory()) {
      return Row(
        children: [
          Expanded(child: CustomTextFormField(controller: minSalaryController, hintText: "Min Salary", keyboard: TextInputType.number)),
          const SizedBox(width: 10),
          Expanded(child: CustomTextFormField(controller: maxSalaryController, hintText: "Max Salary", keyboard: TextInputType.number)),
        ],
      );
    }
    return CustomTextFormField(
      controller: adPriceController,
      hintText: "Price",
      keyboard: TextInputType.number,
      fixedPrefix: Text(Constant.currencySymbol),
    );
  }

  Widget _buildContactSection() {
    return Column(
      children: [
        CustomTextFormField(controller: adPhoneNumberController, hintText: "Phone Number", keyboard: TextInputType.phone),
        const SizedBox(height: 10),
        CustomTextFormField(controller: adAdditionalDetailsController, hintText: "Video Link (Optional)"),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: UiUtils.buildButton(
        context,
        onPressed: () => _onNext(),
        buttonTitle: "next".tr(),
      ),
    );
  }

  void _onNext() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_pickTitleImage.pickedFile == null && titleImageURL.isEmpty) {
        UiUtils.showBlurredDialoge(context, dialoge: BlurredDialogBox(title: "Image Required", content: const Text("Please select a main image")));
        return;
      }
    }
  }

  Widget _buildBreadcrumbs() {
    if (widget.breadCrumbItems == null) return const SizedBox.shrink();
    return Wrap(
      children: widget.breadCrumbItems!.map((e) => CustomText("${e.name} > " , fontSize: 16 , fontWeight: FontWeight.w600,)).toList(),
    );
  }
}