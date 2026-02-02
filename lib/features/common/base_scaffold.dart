import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/ui_utils.dart';
import '../../core/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../core/widgets/bottom_navigation_bar/diamond_fab.dart';
import '../../core/widgets/custom_text.dart';
import '../addAds/views/select_category_view.dart';
import '../home/views/home_screen.dart';
import '../settings/settings_screen.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body; // Made optional because we might use the internal stack
  final String? title;
  final bool showAppBar;
  final bool showBottomNav;
  final bool showFab;
  final Widget? bottomNavigationBar;
  final BottomNavigationController? bottomNavController;

  const BaseScaffold({
    super.key,
    this.body, // The specific body if you're NOT using nav
    this.title,
    this.showAppBar = true,
    this.showBottomNav = true,
    this.bottomNavController,
    this.showFab = false,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    // If no controller is passed, we use a fallback, but for navigation
    // to work across the app, you should pass a shared one.
    final controller = bottomNavController ?? BottomNavigationController();

    // The master list of screens for your app's main navigation
    final List<Widget> mainPages = [
      body ??  HomeScreen(), // Index 0: Home (or passed body)
      const SettingsScreen(),      // Index 1: Settings
    ];

    return FutureBuilder<bool>(
      future: UiUtils.isUserLoggedIn(),
      builder: (context, snapshot) {
        final isLoggedIn = snapshot.data ?? false;

        return ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            return Scaffold(
              appBar: showAppBar
                  ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppBar(
                  title: CustomText(
                    // Handle title automatically based on index
                    controller.index == 1 ? 'settingsLbl'.tr() : (title ?? 'home'.tr()),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  centerTitle: true,
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
              )
                  : null,

              // RIGHT HERE: The BaseScaffold handles the switching logic
              body: SafeArea(
                child: IndexedStack(
                  index: controller.index,
                  children: mainPages,
                ),
              ),

              bottomNavigationBar: bottomNavigationBar ?? (showBottomNav
                  ? CustomBottomNavigationBar(
                controller: controller,
              )
                  : null),

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
      },
    );
  }
}