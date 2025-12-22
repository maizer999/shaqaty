import 'package:flutter/material.dart';

/// =======================================================
/// COLORS
/// =======================================================





/// Light colors
const Color primaryColorLight = Color(0xFFF6F5FA);
const Color secondaryColorLight = Color(0xFFFFFFFF);
const Color territoryColorLight = Color(0xff00B2CA);
const Color forthColorLight = Color(0xffFA6E53);
const Color textDarkColor = Color(0xFF000000);

/// Dark colors
const Color primaryColorDark = Color(0xff121212);
const Color secondaryColorDark = Color(0xff1C1C1C);
const Color territoryColorDark = Color(0xff00B2CA);
const Color textColorDarkTheme = Color(0xffFDFDFD);

/// Messages
const Color errorMessageColor = Color.fromARGB(255, 166, 4, 4);
const Color successMessageColor = Color(0xff00B2CA);
const Color warningMessageColor = Color(0xFFC2AF6F);

/// Buttons
const Color pendingButtonColor = Color(0xff0C5D9C);
const Color soldOutButtonColor = Color(0xffFFBB33);
const Color deactivateButtonColor = Color(0xffFE0000);
const Color activateButtonColor = Color(0xFF02AD11);


const Color territoryColor_ = Color(0xFF21899C);
const Color forthColor_ = Color(0xffFA6E53);
/// =======================================================
/// COLOR HELPERS (Brightness-safe)
/// =======================================================


// 1. Define the font sizes class
class FontSizes {
  double get smaller => 10;
  double get small => 12;
  double get normal => 14;
  double get large => 16;
  double get larger => 18;
  double get extraLarge => 24;
  double get xxLarge => 28;
}

// 2. Create the extension on TextTheme
extension TextThemeExtension on TextTheme {
  FontSizes get font => FontSizes();
}



Color primaryColor(Brightness brightness) =>
    brightness == Brightness.light
        ? primaryColorLight
        : primaryColorDark;

Color secondaryColor(Brightness brightness) =>
    brightness == Brightness.light
        ? secondaryColorLight
        : secondaryColorDark;

Color textPrimaryColor(Brightness brightness) =>
    brightness == Brightness.light
        ? textDarkColor
        : textColorDarkTheme;

/// Shimmer
Color shimmerBaseColor(Brightness brightness) =>
    brightness == Brightness.light
        ? const Color(0xFFE1E1E1)
        : const Color(0xFF969696);

Color shimmerHighlightColor(Brightness brightness) =>
    brightness == Brightness.light
        ? Colors.grey.shade100
        : Colors.grey.shade300;

Color shimmerContentColor(Brightness brightness) =>
    brightness == Brightness.light
        ? Colors.white.withOpacity(0.85)
        : Colors.white.withOpacity(0.7);

/// =======================================================
/// FONT EXTENSION
/// =======================================================

extension TextThemeForFont on TextTheme {
  FontSizes get font => FontSizes();
}



/// =======================================================
/// THEME SETUP
/// =======================================================

enum AppThemeMode { light, dark }

class AppThemeConfig {
  static const String fontFamily = "Manrope";
  static const bool useMaterial3 = true;

  static final themes = {
    AppThemeMode.light: ThemeData(
      brightness: Brightness.light,
      useMaterial3: useMaterial3,
      fontFamily: fontFamily,

      scaffoldBackgroundColor: secondaryColorLight,

      colorScheme: ColorScheme.fromSeed(
        seedColor: territoryColorLight,
        brightness: Brightness.light,
        error: errorMessageColor,
      ),

      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: territoryColorLight,
        cursorColor: territoryColorLight,
        selectionHandleColor: territoryColorLight,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(territoryColorLight),
        trackColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? territoryColorLight.withOpacity(0.3)
              : primaryColorDark,
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: secondaryColorLight,
        foregroundColor: textDarkColor,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    AppThemeMode.dark: ThemeData(
      brightness: Brightness.dark,
      useMaterial3: useMaterial3,
      fontFamily: fontFamily,

      scaffoldBackgroundColor: secondaryColorDark,

      colorScheme: ColorScheme.fromSeed(
        seedColor: territoryColorDark,
        brightness: Brightness.dark,
        error: errorMessageColor.withOpacity(0.7),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: territoryColorDark,
        cursorColor: territoryColorDark,
        selectionHandleColor: territoryColorDark,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(territoryColorDark),
        trackColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? territoryColorDark.withOpacity(0.3)
              : primaryColorLight.withOpacity(0.2),
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: secondaryColorDark,
        foregroundColor: textColorDarkTheme,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  };
}



///Light Theme Colors
///This color format is different, isn't it? .You can use hex colors here also but you have to remove '#' symbol and add 0xff instead.
const Color primaryColor_ = Color(0xFFF6F5FA);
const Color secondaryColor_ = Color(0xFFFFFFFF);
const Color _backgroundColor = primaryColor_; //here you can change if you need
Color lightTextColor = const Color(0xFF000000).withValues(alpha: 0.5);
Color widgetsBorderColorLight = const Color(0xffEEEEEE).withValues(alpha: 0.6);
//Color senderChatColor = const Color.fromARGB(255, 233, 233, 233).withValues(22);

///Dark Theme Colors
Color deactivateColorLight = const Color(0xff7F7F7F);

const Color forthColorDark = Color(0xffFA6E53);
Color backgroundColorDark = primaryColorDark; //here you can change if you need
Color lightTextColorDarkTheme = const Color(0xffFDFDFD).withValues(alpha: 0.3);
Color widgetsBorderColorDark = const Color(0x1aFDFDFD);

Color orangeColor = Colors.orange;

///Messages Color

//Button text color
const Color buttonTextColor = Colors.white;





///Advance
//Theme settings
extension ColorPrefs on ColorScheme {
  Color get primaryColor => _getColor(
    brightness,
    lightColor: primaryColor_,
    darkColor: primaryColorDark,
  );

  Color get secondaryColor => _getColor(
    brightness,
    lightColor: secondaryColor_,
    darkColor: secondaryColorDark,
  );

  Color get secondaryDetailsColor => _getColor(
    brightness,
    lightColor: secondaryColor_,
    darkColor: primaryColorDark,
  );

  Color get territoryColor => _getColor(
    brightness,
    lightColor: territoryColor_,
    darkColor: territoryColorDark,
  );

  Color get deactivateColor => _getColor(
    brightness,
    lightColor: deactivateColorLight,
    darkColor: deactivateColorLight,
  );

  Color get forthColor =>
      _getColor(brightness, lightColor: forthColor_, darkColor: forthColorDark);

  Color get backgroundColor => _getColor(
    brightness,
    lightColor: _backgroundColor,
    darkColor: backgroundColorDark,
  );

  Color get buttonColor => buttonTextColor;

  Color get textColorDark => _getColor(
    brightness,
    lightColor: textDarkColor,
    darkColor: textColorDarkTheme,
  );

  Color get textDefaultColor => _getColor(
    brightness,
    lightColor: textDarkColor,
    darkColor: textColorDarkTheme,
  );

  Color get textLightColor => _getColor(
    brightness,
    lightColor: lightTextColor,
    darkColor: lightTextColorDarkTheme,
  );

  Color get borderColor => _getColor(
    brightness,
    lightColor: widgetsBorderColorLight,
    darkColor: secondaryColorDark.withValues(alpha: 0.2),
  );

  Color get inverseThemeColor => _getColor(
    brightness,
    lightColor: secondaryColorDark,
    darkColor: secondaryColor_,
  );



  Color get blackColor => Colors.black;

  Color get shimmerBaseColor => brightness == Brightness.light
      ? const Color.fromARGB(255, 225, 225, 225)
      : const Color.fromARGB(255, 150, 150, 150);

  Color get shimmerHighlightColor => brightness == Brightness.light
      ? Colors.grey.shade100
      : Colors.grey.shade300;

  Color get shimmerContentColor => brightness == Brightness.light
      ? Colors.white.withValues(alpha: 0.85)
      : Colors.white.withValues(alpha: 0.7);
}




/// i made this to access font easily from theme like, Theme.of(context).textTheme.font.small
/// So what is difference here?? in Theme.of(context).textTheme.small and Theme.of(context).textTheme.font.small
/// We use separate class because There will be an execution on BuildContext in [Utils/Extensions/lib] folder so further explanation is there. you can check
class Font {
  ///10
  double get smaller => 10;

  ///12
  double get small => 12;

  ///14
  double get normal => 14;

  ///16
  double get large => 16;

  ///18
  double get larger => 18;

  ///24
  double get extraLarge => 24;

  ///28
  double get xxLarge => 28;
}

Color _getColor(
    Brightness brightness, {
      required Color lightColor,
      required Color darkColor,
    }) {
  if (Brightness.light == brightness) {
    return lightColor;
  } else {
    return darkColor;
  }
}


// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       pageTransitionsTheme: const PageTransitionsTheme(
//         builders: {
//           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//         },
//       ),
//       disabledColor: AppColors.kBorderColor,
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       brightness: Brightness.light,
//       unselectedWidgetColor: Colors.white,
//       primaryColor: AppColors.kPrimaryLight,
//       fontFamily: AppStrings.fontFamily,
//       colorScheme: const ColorScheme.light(
//         primary: AppColors.kPrimaryColor,
//         secondary: AppColors.calendarSelected,
//         error: AppColors.kDarkRed,
//         surface: AppColors.kWhite,),
//       appBarTheme: const AppBarTheme(
//         color: AppColors.kPrimaryColor,
//         elevation: 0.0,
//         titleTextStyle: TextStyle(
//           fontFamily: AppStrings.mawaniFontFamily,
//           color: AppColors.kWhite,
//           fontWeight: FontWeight.bold,
//         ),
//         actionsIconTheme: IconThemeData(color: AppColors.kWhite),
//       ),
//       scaffoldBackgroundColor: AppColors.kWhite,
//       // primaryTextTheme:,
//       // textTheme: ,
//       buttonTheme: ButtonThemeData(
//         buttonColor: AppColors.kPrimaryColor,
//         textTheme: ButtonTextTheme.primary,
//         height: 48,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         fillColor: AppColors.kWhite,
//         filled: true,
//         enabledBorder: UnderlineInputBorder(
//           borderSide: const BorderSide(
//             color: AppColors.kBorderColor,
//           ),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.red,
//           ),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: const BorderSide(
//             color: AppColors.kAquaGreen,
//           ),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: Colors.red,
//           ),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         disabledBorder: UnderlineInputBorder(
//           borderSide: const BorderSide(
//             width: 0.5,
//             color: AppColors.kAquaGreen,
//           ),
//           //borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     );
//   }
//
//   static ThemeData get lightTheme2 {
//     return ThemeData(
//       brightness: Brightness.light,
//       fontFamily: AppStrings.fontFamily,
//       scaffoldBackgroundColor: AppColors.kWhite,
//       colorScheme: const ColorScheme.light(
//         primary: AppColors.kPrimaryColor,
//         secondary: AppColors.kSecondaryLight,
//         error: AppColors.kDarkRed,
//         surface: AppColors.kWhite,),
//       textTheme: TextTheme( ),
//
//
//     );
//   }
// }

enum AppTheme {
  /// Light theme mode
  light,

  /// Dark theme mode
  dark,
}
