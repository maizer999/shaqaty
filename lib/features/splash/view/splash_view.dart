import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/features/login/views/login_view.dart';
import 'package:flutter_core/features/login/views/widgets/login_header.dart';
import 'package:http/http.dart' as ref;
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/language/secure_storage.dart';
import '../../../core/utils/system_preferences_helper.dart';
import '../../home/views/home_screen.dart';
import '../../login/views/controller/login_provider.dart';

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

    // 1. Check for stored credentials
    final credentials = await SecureStorageHelper.getCredentials();
    SystemPreferencesHelper.setLanguageCode("ar");
    print(credentials[SecureStorageConstants.userName]);
    print(credentials[SecureStorageConstants.password]);


      if (credentials[SecureStorageConstants.userName] != null && credentials[SecureStorageConstants.password] != null) {
        try {

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        } catch (e) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        }
      } else {
        // 3. No credentials? Go to Login
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));

    }
  }

  @override
  Widget build(BuildContext context) {
    // Matching the LoginScreen background color
    const Color themeColor = AppColors.primary;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent looks better with safe area
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: themeColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: themeColor, // Same as LoginScreen
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                /// ✅ Reusing your existing LoginHeader (Logo + Text)
                const LoginHeader(),

                const Spacer(flex: 1),

                /// ⏳ Loading Indicator (Optional but professional)
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
                ),

                const Spacer(flex: 2),

                /// 📝 Branding at the bottom
                const Opacity(
                  opacity: 0.8,
                  child: Text(
                    "Home Use App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}