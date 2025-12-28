import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';

import '../../core/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final bool showAppBar;
  final bool showBottomNav;
  final BottomNavigationController? bottomNavController;

  const BaseScaffold({
    super.key,
    required this.body,
    this.title,
    this.showAppBar = true,
    this.showBottomNav = true,
    this.bottomNavController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: showAppBar
            ? PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: CustomText(
              title ?? 'home'.tr(),
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF21899C),
            elevation: 4,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        )
            : null,

      body: SafeArea(child: body),
      bottomNavigationBar: showBottomNav
          ? CustomBottomNavigationBar(
        controller: bottomNavController ?? BottomNavigationController(),
      )
          : null,
    );
  }
}
