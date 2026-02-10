import 'package:flutter/material.dart';

import '../../../../build_context.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/custom_text.dart';

class FilterBottomSheet extends StatefulWidget {
  final RangeValues initialPrice;
  final RangeValues initialSize;
  final String initialCondition;

  const FilterBottomSheet({
    super.key,
    required this.initialPrice,
    required this.initialSize,
    required this.initialCondition,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late RangeValues _priceRange;
  late RangeValues _sizeRange;
  late String _condition;

  final double maxPriceLimit = 500000;
  final double maxSizeLimit = 1000;

  @override
  void initState() {
    super.initState();
    _priceRange = RangeValues(
      widget.initialPrice.start.clamp(0, maxPriceLimit),
      widget.initialPrice.end.clamp(0, maxPriceLimit),
    );
    _sizeRange = RangeValues(
      widget.initialSize.start.clamp(0, maxSizeLimit),
      widget.initialSize.end.clamp(0, maxSizeLimit),
    );
    _condition = widget.initialCondition;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)))),
          const SizedBox(height: 20),
          const CustomText("تصفية النتائج", fontWeight: FontWeight.bold, fontSize: 18),
          const SizedBox(height: 25),

          // الحالة
          const CustomText("حالة العقار", fontWeight: FontWeight.w600),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildChip("all", "الكل"),
              const SizedBox(width: 8),
              _buildChip("new", "جديد"),
              const SizedBox(width: 8),
              _buildChip("old", "مستعمل"),
            ],
          ),

          const SizedBox(height: 25),

          // السعر
          CustomText("السعر: \$${_priceRange.start.toInt()} - \$${_priceRange.end.toInt()}", fontWeight: FontWeight.w600),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: maxPriceLimit,
            divisions: 100,
            onChanged: (v) => setState(() => _priceRange = v),
          ),

          const SizedBox(height: 25),

          // المساحة (بمقدار 10)
          CustomText("المساحة: ${_sizeRange.start.toInt()} - ${_sizeRange.end.toInt()} م²", fontWeight: FontWeight.w600),
          RangeSlider(
            values: _sizeRange,
            min: 0,
            max: maxSizeLimit,
            divisions: 100, // 1000 / 100 = 10
            labels: RangeLabels("${_sizeRange.start.toInt()}", "${_sizeRange.end.toInt()}"),
            onChanged: (v) => setState(() => _sizeRange = v),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.color.territoryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context, {
                  "min_price": _priceRange.start,
                  "max_price": _priceRange.end,
                  "min_size": _sizeRange.start,
                  "max_size": _sizeRange.end,
                  "condition": _condition,
                });
              },
              child: const CustomText("تطبيق", color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildChip(String val, String label) {
    bool isSel = _condition == val;
    return ChoiceChip(
      label: Text(label),
      selected: isSel,
      onSelected: (_) => setState(() => _condition = val),
      selectedColor: context.color.territoryColor.withOpacity(0.2),
    );
  }
}