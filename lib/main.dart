import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/features/splash/view/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/settings/theme_control.dart';

late final ProviderContainer providerContainer;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  providerContainer = ProviderContainer();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(

    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      child: const ProviderScope(child: MyApp()),
    ),
  );
}
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    // 1. Watch the theme state here
    final themeMode = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shaqaty',
          // 2. Link the themeMode to the MaterialApp
          themeMode: themeMode,

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.deepPurple,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.grey.shade50,
            cardColor: Colors.white, // Ensure card color is set for light mode
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.deepPurple,
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1E1E1E), // Ensure card color is set for dark mode
          ),

          home: const SplashScreen(),
        );
      },
    );
  }
}


