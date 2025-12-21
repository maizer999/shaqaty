import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/core/theme/app_theme.dart';
import 'package:flutter_core/features/login/views/login_view.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/theme/settings.dart';
import '../../../../core/theme/ui_utils.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_core/build_context.dart';

import '../../home/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    // You can also provide supported languages here if needed
    // final supportedLanguages = ['en', 'ar'];

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: context.color.territoryColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: context.color.territoryColor,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: context.color.territoryColor,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: UiUtils.getSvg(AppIcons.companyLogo),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10.0),
                width: 150,
                height: 150,
                child: UiUtils.getSvg(AppIcons.splashLogo),
              ),
              const SizedBox(height: 10),
              CustomText(
                AppSettings.applicationName,
                fontSize: context.font.xxLarge,
                color: context.color.secondaryColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
