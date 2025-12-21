import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_core/features/splash/view/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/constants/app_strings.dart';
import 'core/utils/language/language_listner_widget.dart';
import 'core/utils/language/translation_loader.dart';
import 'core/utils/system_preferences_helper.dart';

late final ProviderContainer providerContainer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await EasyLocalization.ensureInitialized();
  String? lang = await SystemPreferencesHelper.getLanguageCode();
  providerContainer = ProviderContainer();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale(lang ?? 'en'),
        assetLoader: ApiTranslationLoader(languages: {}),
        child: const MyApp(),
      ),
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          localizationsDelegates: [
            ...context.localizationDelegates,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) => LanguageListener(child: child!),
          // Simply show the splash UI
          home: const SplashScreen(),
        );
      },
    );
  }
}

