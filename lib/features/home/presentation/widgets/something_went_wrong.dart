import 'package:flutter/material.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/core/theme/translate.dart';
import 'package:flutter_core/features/home/presentation/widgets/app_theme.dart';

import '../../../../core/theme/app_icon.dart';
import '../../../../core/theme/ui_utils.dart';
import '../../../../core/widgets/grid_list_adapter.dart';
import '../../../common/widgets/custom_text.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: UiUtils.getSvg(AppIcons.somethingWentWrong));
  }
}

class NoChatFound extends StatelessWidget {
  const NoChatFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiUtils.getSvg(AppIcons.no_chat_found),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            child: CustomText(
              "${"noChatFoundStartNewConversation".translate(context)}",
              fontSize: context.font.larger,
              textAlign: TextAlign.center,
              color: context.color.territoryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
