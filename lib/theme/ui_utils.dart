import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/theme/translate.dart';
import 'package:flutter_core/user_managment/home/widgets/currency_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mime_type/mime_type.dart';
import '../data/constant.dart';
import '../features/common/widgets/custom_text.dart';
import '../user_managment/home/widgets/app_theme.dart';
import '../user_managment/home/widgets/item_model.dart';
import 'app_icon.dart';

class UiUtils {

  static Widget imageType(
      String url, {
        double? width,
        double? height,
        BoxFit? fit,
        Color? color,
      }) {
    String? extension = mime(url);
    if (extension == "image/svg+xml") {
      return getSvgImage(
        url,
        fit: fit,
        height: height,
        width: width,
        color: color,
      );
    } else {
      return getImage(url, fit: fit, height: height, width: width);
    }
  }

  static Widget progress({
    double? width,
    double? height,
    Color? normalProgressColor,
    bool? showWhite,
    bool preserveMatte = true,
    bool play = true,
  }) {
    final bool wantsWhite = showWhite ?? false;
    final Color color =
        normalProgressColor ?? (wantsWhite ? Colors.white : territoryColor_);

    if (Constant.useLottieProgress) {
      return LottieBuilder.asset(
        'assets/lottie/${showWhite ?? false ? Constant.progressLottieFileWhite : Constant.loadingSuccessLottieFile}',
        width: width ?? 70,
        height: height ?? 70,
        animate: play,
        delegates: LottieDelegates(
          values: [
            ValueDelegate.color(const [
              'center dot',
              'Ellipse 1',
              'Fill 1',
            ], value: color),
            ValueDelegate.color(const [
              'center zoom in',
              'Ellipse 1',
              'Fill 1',
            ], value: color),
            ValueDelegate.color(const [
              'center mask out',
              'Ellipse 1',
              'Fill 1',
            ], value: color),

            ValueDelegate.strokeColor(const [
              'Semi circle 1',
              'Ellipse 1',
              'Stroke 1',
            ], value: color),
            ValueDelegate.strokeColor(const [
              'Semi circle 2',
              'Ellipse 1',
              'Stroke 1',
            ], value: color),

            ValueDelegate.strokeColor(const ['**', 'Stroke 1'], value: color),
            ValueDelegate.color(const ['**', 'Fill 1'], value: color),

            if (!preserveMatte)
              ValueDelegate.color(const [
                'matte',
                'Ellipse 1',
                'Fill 1',
              ], value: color),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator(color: normalProgressColor);
    }
  }

  static String formatDisplayAddress(String address) {
    // Split by comma and trim extra spaces
    List<String> parts = address.split(',').map((e) => e.trim()).toList();

    // Remove consecutive duplicates
    List<String> uniqueParts = [];
    for (int i = 0; i < parts.length; i++) {
      if (i == 0 || parts[i].toLowerCase() != parts[i - 1].toLowerCase()) {
        uniqueParts.add(parts[i]);
      }
    }

    // Join back into formatted address
    return uniqueParts.join(', ');
  }

  static Widget getPriceWidget(ItemModel item, BuildContext context) {
    final category = item.category;
    final color = context.color.territoryColor;

    if (category == null) return SizedBox.shrink();

    if (category.isJobCategory == 1) {
      final min = item.minSalary;
      final max = item.maxSalary;

      if (min != null && max != null) {
        return CustomText(
          '${min.currencyFormat} - ${max.currencyFormat}',
          color: color,
          fontWeight: FontWeight.bold,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          fontSize: context.font.large,
          maxLines: 1,
        );
      } else if (min != null) {
        return CustomText(
          "${"from".translate(context)}\t${min.currencyFormat}",
          color: color,
          fontWeight: FontWeight.bold,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          fontSize: context.font.large,
          maxLines: 1,
        );
      } else if (max != null) {
        return CustomText(
          "${"up_to".translate(context)}\t${max.currencyFormat}",
          color: color,
          fontWeight: FontWeight.bold,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          fontSize: context.font.large,
          maxLines: 1,
        );
      }
    } else if (category.priceOptional == 1) {
      if (item.price != null) {
        return CustomText(
          item.price!.currencyFormat,
          color: color,
          fontWeight: FontWeight.bold,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          fontSize: context.font.large,
          maxLines: 1,
        );
      }
    } else {
      return CustomText(
        (item.price ?? 0.0).currencyFormat,
        color: color,
        fontWeight: FontWeight.bold,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        fontSize: context.font.larger,
        maxLines: 1,
      );
    }

    return SizedBox.shrink();
  }

  static SystemUiOverlayStyle getSystemUiOverlayStyle({
    required BuildContext context,
    required Color statusBarColor,
    Color? navigationBarColor,
  }) {
    bool isDarkMode = false ;
    Brightness iconBrightness = isDarkMode ? Brightness.light : Brightness.dark;
    return SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: iconBrightness,
      systemNavigationBarColor:
      navigationBarColor ?? context.color.secondaryColor,
      statusBarColor: statusBarColor,
      statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: iconBrightness,
    );
  }

  static SvgPicture getSvg(
    String path, {
    Color? color,
    BoxFit? fit,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      path,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
      fit: fit ?? BoxFit.contain,
      width: width,
      height: height,
    );
  }


  static bool displayPrice(ItemModel item) {
    final category = item.category;

    if (category == null) return false; // Null check for safety

    if (category.isJobCategory == 1) {
      return item.minSalary != null || item.maxSalary != null;
    } else if (category.priceOptional == 1) {
      return item.price != null;
    } else {
      return true;
    }
  }

  static Locale getLocaleFromLanguageCode(String languageCode) {
    List<String> result = languageCode.split("-");
    return result.length == 1
        ? Locale(result.first)
        : Locale(result.first, result.last);
  }

  static Widget getSvgImage(
    String url, {
    double? width,
    double? height,
    BoxFit? fit,
    String? blurHash,
    bool? showFullScreenImage,
    Color? color,
  }) {
    return SvgPicture.network(
      url,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
      width: width,
      height: height,
      fit: fit!,
      placeholderBuilder: (context) {
        return placeholderWidget(context, width, height);
      },
    );
  }

  static Widget getImage(
    String url, {
    double? width,
    double? height,
    BoxFit? fit,
    String? blurHash,
    bool? showFullScreenImage,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) {
        return placeholderWidget(context, width, height);
      },
      errorWidget: (context, url, error) {
        return placeholderWidget(context, width, height);
      },
    );
  }

  static Widget placeholderWidget(
      BuildContext context,
      double? width,
      double? height,
      ) {
    return Container(
      width: width,
      color: context.color.territoryColor,
      height: height,
      alignment: AlignmentDirectional.center,
      child: SizedBox(
        width: width,
        height: height,
        child: getSvg(
          AppIcons.placeHolder,
          width: width ?? 70,
          height: height ?? 70,
        ),
      ),
    );
  }

}


extension FormatAmount on String {
  String formatDate({String? format}) {
    DateFormat dateFormat;
    try {
      dateFormat = DateFormat(format ?? "MMM d, yyyy", Constant.currentLocale);
    } on Exception catch (_) {
      dateFormat = DateFormat(format ?? "MMM d, yyyy", 'en_US');
    }
    String formatted = dateFormat.format(DateTime.parse(this));
    return formatted;
  }

  String formatPercentage() {
    return "${toString()} %";
  }

  String formatId() {
    return " # ${toString()} "; // \u{20B9}"; //currencySymbol
  }

  String firstUpperCase() {
    String upperCase = "";
    var suffix = "";
    if (isNotEmpty) {
      upperCase = this[0].toUpperCase();
      suffix = substring(1, length);
    }
    return (upperCase + suffix);
  }


}



extension ScrollEndListen on ScrollController {
  ///It will check if scroll is at the bottom or not
  bool isEndReached() {
    return offset >= position.maxScrollExtent;
  }
}

class RemoveGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return child;
  }
}

class RoundedBorderOnSomeSidesWidget extends StatelessWidget {
  /// Color of the content behind this widget
  final Color contentBackgroundColor;
  final Color borderColor;
  final Widget child;

  final double borderRadius;
  final double borderWidth;

  /// The sides where we want the rounded border to be
  final bool topLeft;
  final bool topRight;
  final bool bottomLeft;
  final bool bottomRight;

  const RoundedBorderOnSomeSidesWidget({
    super.key,
    required this.borderColor,
    required this.contentBackgroundColor,
    required this.child,
    required this.borderRadius,
    required this.borderWidth,
    this.topLeft = false,
    this.topRight = false,
    this.bottomLeft = false,
    this.bottomRight = false,
  });

  @override
  Widget build(BuildContext context) {
    Radius mainRadius = Radius.circular(borderRadius);
    Radius subRadius = Radius.circular(borderRadius - borderWidth);
    return Container(
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.only(
          topLeft: topLeft ? mainRadius : Radius.zero,
          topRight: topRight ? mainRadius : Radius.zero,
          bottomLeft: bottomLeft ? mainRadius : Radius.zero,
          bottomRight: bottomRight ? mainRadius : Radius.zero,
        ),
      ),
      child: Container(
        margin: EdgeInsetsDirectional.only(
          top: topLeft || topRight ? borderWidth : 0,
          start: topLeft || bottomLeft ? borderWidth : 0,
          bottom: bottomLeft || bottomRight ? borderWidth : 0,
          end: topRight || bottomRight ? borderWidth : 0,
        ),
        decoration: BoxDecoration(
          color: contentBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: topLeft ? subRadius : Radius.zero,
            topRight: topRight ? subRadius : Radius.zero,
            bottomLeft: bottomLeft ? subRadius : Radius.zero,
            bottomRight: bottomRight ? subRadius : Radius.zero,
          ),
        ),
        child: child,
      ),
    );
  }
}

extension ColorUtils on Color {
  int toInt() {
    final alpha = (a * 255).toInt();
    final red = (r * 255).toInt();
    final green = (g * 255).toInt();
    final blue = (b * 255).toInt();
    // Combine the components into a single int using bit shifting
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
  }
}

class AnnotatedSafeArea extends StatefulWidget {
  final Widget child;
  final bool isAnnotated;
  final Color? statusBarColor;
  final Color? navigationBarColor;

  const AnnotatedSafeArea({
    super.key,
    required this.child,
    this.isAnnotated = false,
    this.navigationBarColor,
    this.statusBarColor,
  });

  @override
  State<AnnotatedSafeArea> createState() => _AnnotatedSafeAreaState();
}

class _AnnotatedSafeAreaState extends State<AnnotatedSafeArea> {
  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      color: widget.statusBarColor ?? context.color.secondaryColor,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: widget.child,
    );

    if (widget.isAnnotated) {
      content = AnnotatedRegion<SystemUiOverlayStyle>(
        value: UiUtils.getSystemUiOverlayStyle(
          context: context,
          statusBarColor: widget.statusBarColor ?? context.color.secondaryColor,
          navigationBarColor:
          widget.navigationBarColor ?? context.color.secondaryColor,
        ),
        child: content,
      );
    }

    return content;
  }
}
