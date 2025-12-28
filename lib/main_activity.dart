// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/shared/models/data/system_settings_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'build_context.dart';
import 'core/hive/hive_utils.dart';
import 'core/routes/route_constant.dart';
import 'core/theme/app_icon.dart';
import 'core/theme/theme.dart';
import 'core/theme/ui_utils.dart';
import 'core/utils/blurred_dialog_box.dart';
import 'core/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'core/widgets/constant.dart';
import 'core/widgets/custom_text.dart';
import 'core/widgets/helper_utils.dart';
import 'features/home/views/home_screen.dart';

Map<String, dynamic> searchBody = {};
String selectedCategoryId = "0";
String selectedCategoryName = "";
dynamic selectedCategory;

//this will set when i will visit in any category
dynamic currentVisitingCategoryId = "";
dynamic currentVisitingCategory = "";

class MainActivity extends StatefulWidget {
  final String from;
  final String? itemSlug;
  final String? sellerId;
  static final GlobalKey<MainActivityState> globalKey =
      GlobalKey<MainActivityState>();

  MainActivity({Key? key, required this.from, this.itemSlug, this.sellerId})
    : super(key: globalKey);

  @override
  State<MainActivity> createState() => MainActivityState();

  static Route route(RouteSettings routeSettings) {
    Map arguments = routeSettings.arguments as Map;
    return MaterialPageRoute(
      builder: (_) => MainActivity(
        from: arguments['from'] as String,
        itemSlug: arguments['slug'] as String?,
        sellerId: arguments['sellerId'] as String?,
      ),
    );
  }
}

class MainActivityState extends State<MainActivity> {
  final PageController _pageController = PageController();
  final BottomNavigationController _bottomNavigationController =
      BottomNavigationController();

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // FetchSystemSettingsCubit settings = context
        // .read<FetchSystemSettingsCubit>();
    // if (!bool.fromEnvironment(
    //   Constant.forceDisableDemoMode,
    //   defaultValue: false,
    // )) {
    //   Constant.isDemoModeOn =
    //       settings.getSetting(SystemSetting.demoMode) ?? false;
    // }
    // var numberWithSuffix = settings.getSetting(SystemSetting.numberWithSuffix);
    // Constant.isNumberWithSuffix = numberWithSuffix == "1" ? true : false;
    //
    // ///This will check for update
    // versionCheck(settings);
    //
    // if (widget.itemSlug != null) {
    //   Navigator.of(context).pushNamed(
    //     Routes.adDetailsScreen,
    //     arguments: {"slug": widget.itemSlug!},
    //   );
    // }
    // if (widget.sellerId != null) {
    //   Navigator.pushNamed(
    //     context,
    //     Routes.sellerProfileScreen,
    //     arguments: {"sellerId": int.parse(widget.sellerId!)},
    //   );
    // }

    _bottomNavigationController.addListener(() {
      _pageController.jumpToPage(_bottomNavigationController.index);
    });
  }

  void completeProfileCheck() {
    // if (HiveUtils.getUserDetails().name == "" ||
    //     HiveUtils.getUserDetails().email == "") {
    //   Future.delayed(const Duration(milliseconds: 100), () {
    //     Navigator.pushReplacementNamed(
    //       context,
    //       Routes.completeProfile,
    //       arguments: {"from": "login"},
    //     );
    //   });
    // }
  }

  void versionCheck(settings) async {
    var remoteVersion = settings.getSetting(
      Platform.isIOS ? SystemSetting.iosVersion : SystemSetting.androidVersion,
    );
    var remote = remoteVersion;

    var forceUpdate = settings.getSetting(SystemSetting.forceUpdate);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    var current = packageInfo.version;

    int currentVersion = HelperUtils.comparableVersion(packageInfo.version);
    if (remoteVersion == null) {
      return;
    }

    remoteVersion = HelperUtils.comparableVersion(remoteVersion);

    if (remoteVersion > currentVersion) {
      Constant.isUpdateAvailable = true;
      Constant.newVersionNumber = settings.getSetting(
        Platform.isIOS
            ? SystemSetting.iosVersion
            : SystemSetting.androidVersion,
      );

      Future.delayed(Duration.zero, () {
        //This is force update -> forceUpdate == "1"
        UiUtils.showBlurredDialoge(
          context,
          dialoge: BlurredDialogBox(
            onAccept: () async {
              await launchUrl(
                Uri.parse(
                  Platform.isAndroid
                      ? Constant.playStoreUrl
                      : Constant.appStoreUrl,
                ),
                mode: LaunchMode.externalApplication,
              );
            },
            acceptTextColor: Colors.white,
            backAllowedButton: forceUpdate != "1",
            svgImagePath: AppIcons.update,
            isAcceptContainerPush: forceUpdate == "1",
            svgImageColor: context.color.territoryColor,
            showCancelButton: forceUpdate != "1",
            title: "updateAvailable".tr,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (forceUpdate == "1") CustomText("$current>$remote"),
                CustomText(
                  (forceUpdate == "1"
                          ? "newVersionAvailableForce"
                          : "newVersionAvailable")
                      .tr,
                ),
              ],
            ),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bottomNavigationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion(
      value: UiUtils.getSystemUiOverlayStyle(
        context: context,
        statusBarColor: context.color.primaryColor,
      ),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (_bottomNavigationController.index != 0) {
            _bottomNavigationController.changeIndex(0);
          } else {
            if (_timer == null) {
              _timer = Timer(const Duration(seconds: 2), () {
                _timer?.cancel();
                _timer = null;
              });
              HelperUtils.showSnackBarMessage(
                context,
                "pressAgainToExit".tr,
                isFloating: true,
              );
            } else {
              SystemNavigator.pop();
            }
          }
        },
        child: Scaffold(
          backgroundColor: context.color.primaryColor,
          bottomNavigationBar: CustomBottomNavigationBar(
            controller: _bottomNavigationController,
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            children: <Widget>[
              PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  HomeScreen(),
                  // ChatListScreen(),
                  // ItemsScreen(),
                  //  ProfileScreen(),
                ],
              ),
              // if (Constant.maintenanceMode == "1") MaintenanceMode(),
            ],
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    print(index);
    _bottomNavigationController.changeIndex(index);
  }
}
