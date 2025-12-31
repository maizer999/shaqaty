import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../build_context.dart';
import '../../theme/app_icon.dart';
import '../../theme/theme.dart';
import '../../theme/ui_utils.dart';
import '../custom_text.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({required this.controller, super.key});

  final BottomNavigationController controller;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final items = [
    _BottomNavigationItem(
      icon: AppIcons.homeNav,
      activeIcon: AppIcons.homeNavActive,
      label: 'homeTab',
    ),
    _BottomNavigationItem(
      icon: AppIcons.chatNav,
      activeIcon: AppIcons.chatNavActive,
      label: 'chat',
    ),
    // This null value is to be used for giving space at the center of bottom nav to avoid placing items behind the FAB
    null,
    _BottomNavigationItem(
      icon: AppIcons.myAdsNav,
      activeIcon: AppIcons.myAdsNavActive,
      label: 'myAdsTab',
    ),
    _BottomNavigationItem(
      icon: AppIcons.profileNav,
      activeIcon: AppIcons.profileNavActive,
      label: 'profileTab',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // SafeArea for Android/iOS edge-to-edge mode
    double bottomNavHeight = kBottomNavigationBarHeight;
    if (Platform.isIOS) {
      bottomNavHeight += MediaQuery.paddingOf(context).bottom;
    }
    return SafeArea(
      bottom: Platform.isAndroid,
      child: SizedBox(
        height: bottomNavHeight,
        child: ColoredBox(
          color: context.color.secondaryColor,
          child: ListenableBuilder(
            listenable: widget.controller,
            builder: (context, child) {
              final selectedIndex = widget.controller.index;
              int itemIndex = 0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: items.map((item) {
                  if (item == null) return const SizedBox(width: 25);
                  final index = itemIndex++;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (item.label == 'chat' || item.label == 'myAdsTab') {
                          UiUtils.checkUser(
                            onNotGuest: () {
                              widget.controller.changeIndex(index);
                            },
                            context: context,
                          );
                        } else {
                          widget.controller.changeIndex(index);
                        }
                      },
                      child: _BottomNavigationItemWidget(
                        item: item,
                        selected: selectedIndex == index,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Custom controller for [CustomBottomNavigationBar]
class BottomNavigationController extends ChangeNotifier {
  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}

class _BottomNavigationItemWidget extends StatelessWidget {
  const _BottomNavigationItemWidget({
    required this.item,
    required this.selected,
  });

  final _BottomNavigationItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UiUtils.getSvg(
          selected ? item.activeIcon : item.icon,
          color: selected
              ? null
              : context.color.textLightColor.withValues(alpha: .5),
        ),
        CustomText(
          item.label.tr() ?? item.label, // fallback to label
          maxLines: 1,
          color: selected ? null : context.color.textLightColor,
        ),
      ],
    );
  }
}

class _BottomNavigationItem {
  _BottomNavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final String icon;
  final String activeIcon;
  final String label;
}
