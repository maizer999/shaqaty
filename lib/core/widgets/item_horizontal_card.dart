// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

import '../../features/home/data/item_model.dart';
import '../../core/widgets/custom_text.dart';

class ItemHorizontalCard extends StatelessWidget {
  final ItemModel item;
  final List<Widget>? addBottom;
  final double? additionalHeight;
  final StatusButton? statusButton;
  final bool? useRow;
  final VoidCallback? onDeleteTap;
  final double? additionalImageWidth;
  final bool? showLikeButton;

  const ItemHorizontalCard({
    super.key,
    required this.item,
    this.useRow,
    this.addBottom,
    this.additionalHeight,
    this.statusButton,
    this.onDeleteTap,
    this.showLikeButton,
    this.additionalImageWidth,
  });

  Widget favButton(BuildContext context) {
    bool isLike = false; // حالة بسيطة بدون Bloc

    return InkWell(
      onTap: () {
        isLike = !isLike;
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 10,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Icon(
          isLike ? Icons.favorite : Icons.favorite_border,
          color: isLike ? Colors.red : Colors.grey,
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.5),
      child: Container(
        height: addBottom == null ? 124 : (124 + (additionalHeight ?? 0)),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  item.image ?? "",
                                  height: addBottom == null
                                      ? 122
                                      : (122 + (additionalHeight ?? 0)),
                                  width: 100 + (additionalImageWidth ?? 0),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (item.isFeature ?? false)
                                const PositionedDirectional(
                                  start: 5,
                                  top: 5,
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ),
                            ],
                          ),
                          if (statusButton != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3.0,
                                horizontal: 3.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: statusButton!.color,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                width: 80,
                                height: 30,
                                child: Center(
                                  child: CustomText(
                                    statusButton!.lable,
                                    fontWeight: FontWeight.bold,
                                    color: statusButton?.textColor ?? Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            top: 0,
                            start: 12,
                            bottom: 5,
                            end: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      item.translatedName ?? "",
                                      fontWeight: FontWeight.w600,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (showLikeButton ?? true) favButton(context),
                                ],
                              ),
                              if (item.translatedAddress != null && item.translatedAddress != "")
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined, size: 15, color: Colors.grey),
                                    Expanded(
                                      child: CustomText(
                                        item.translatedAddress ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              if (item.created != null && item.created != '')
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_rounded, size: 12, color: Colors.grey),
                                    Expanded(
                                      child: Timeago(
                                        builder: (context, value) => CustomText(
                                          value,
                                          fontSize: 12,
                                          color: Colors.grey,
                                          maxLines: 1,
                                        ),
                                        date: DateTime.parse(item.created!),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (useRow == false || useRow == null) ...addBottom ?? [],
                if (useRow == true) ...{Row(children: addBottom ?? [])},
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusButton {
  final String lable;
  final Color color;
  final Color? textColor;

  StatusButton({required this.lable, required this.color, this.textColor});
}
