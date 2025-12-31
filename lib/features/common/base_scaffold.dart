import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import '../../core/theme/ui_utils.dart';
import '../../core/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../core/widgets/bottom_navigation_bar/diamond_fab.dart';
import '../addAds/views/select_category_view.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final bool showAppBar;
  final bool showBottomNav;
  final bool showFab;
  final BottomNavigationController? bottomNavController;

  const BaseScaffold({
    super.key,
    required this.body,
    this.title,
    this.showAppBar = true,
    this.showBottomNav = true,
    this.bottomNavController,
    this.showFab = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: UiUtils.isUserLoggedIn(),
      builder: (context, snapshot) {
        final isLoggedIn = snapshot.data ?? false;

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
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: showFab && isLoggedIn
              ? DiamondFab(
            type: FabType.round,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SelectCategoryScreen(),
                ),
              );
            },
          )
              : null,



        );
      },
    );
  }

}
