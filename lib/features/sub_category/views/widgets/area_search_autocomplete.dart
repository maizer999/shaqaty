import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/sub_category_provider.dart';
import '../../services/sub_category_service.dart';

class AreaSearchAutocomplete extends ConsumerStatefulWidget {
  const AreaSearchAutocomplete({super.key});

  @override
  ConsumerState<AreaSearchAutocomplete> createState() => _AreaSearchAutocompleteState();
}

class _AreaSearchAutocompleteState extends ConsumerState<AreaSearchAutocomplete> {
  // 🔹 يجب تعريف الاثنين معاً لحل مشكلة الـ Assertion Error
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose(); // تنظيف الـ FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final areaService = ref.watch(areaServiceProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: RawAutocomplete<AreaItem>(
        // 🔹 نمرر الاثنين معاً هنا
        textEditingController: _textController,
        focusNode: _focusNode,

        displayStringForOption: (AreaItem option) => option.name,

        optionsBuilder: (TextEditingValue textEditingValue) async {
          if (textEditingValue.text.length < 2) {
            return const Iterable<AreaItem>.empty();
          }
          final result = await areaService.getAreaSuggestions(textEditingValue.text);
          return result.when(
                  (success) => success,
                  (error) => const Iterable<AreaItem>.empty()
          );
        },

        onSelected: (AreaItem selection) {
          _textController.text = selection.name;
          ref.read(selectedAreaNameProvider.notifier).state = selection.name;
          ref.invalidate(subCategoryProvider);
          _focusNode.unfocus(); // إغلاق لوحة المفاتيح
        },

        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          // ملاحظة: الـ controller و الـ focusNode هنا هما نفس اللذين عرفناهما فوق
          return TextField(
            controller: controller,
            focusNode: focusNode,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: 'ابحث عن المنطقة...',
              prefixIcon: const Icon(Icons.search, color: Colors.blue),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.cancel, size: 20, color: Colors.grey),
                onPressed: () {
                  controller.clear();
                  ref.read(selectedAreaNameProvider.notifier).state = null;
                  ref.invalidate(subCategoryProvider);
                  focusNode.unfocus();
                },
              )
                  : const Icon(Icons.location_on_outlined, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          );
        },

        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Material(
                elevation: 8.0,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  constraints: const BoxConstraints(maxHeight: 250),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: options.length,
                    separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade100),
                    itemBuilder: (context, index) {
                      final AreaItem option = options.elementAt(index);
                      return ListTile(
                        title: Text(
                          option.name,
                          textAlign: TextAlign.right,
                        ),
                        trailing: const Icon(Icons.location_on, size: 16, color: Colors.blue),
                        onTap: () => onSelected(option),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}