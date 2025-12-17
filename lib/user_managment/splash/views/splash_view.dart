import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/user_managment/home/widgets/app_theme.dart';
import '../../../features/common/widgets/custom_text.dart';
import '../../../theme/app_icon.dart';
import '../../../theme/settings.dart';
import '../../../theme/ui_utils.dart';
import '../../home/home_screen.dart';

class SplashImageView extends StatefulWidget {
  const SplashImageView({super.key});

  @override
  State<SplashImageView> createState() => _SplashImageViewState();
}

class _SplashImageViewState extends State<SplashImageView> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  /// Handles the 2-second delay and navigation
  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: context.color.territoryColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: context.color.territoryColor,
        ),
        child: Scaffold(
          backgroundColor: context.color.territoryColor,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: UiUtils.getSvg(AppIcons.companyLogo),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(top: 10.0),
                width: 150,
                height: 150,
                child: UiUtils.getSvg(AppIcons.splashLogo),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomText(
                  AppSettings.applicationName,
                  fontSize: context.font.xxLarge,
                  color: context.color.secondaryColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}