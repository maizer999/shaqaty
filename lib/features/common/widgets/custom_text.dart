import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      this.text, {
        super.key,
        this.color,
        this.fontWeight = FontWeight.w400,
        this.fontStyle,
        this.fontSize = 14,
        this.textAlign,
        this.maxLines,
        this.height,
        this.showUnderline = false,
        this.showLineThrough = false,
        this.underlineOrLineColor,
        this.letterSpacing,
        this.softWrap = true,
        this.overflow,
        this.firstUpperCaseWidget = false,
        this.fontFamily = 'NotoKufiArabic',
      });

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double fontSize;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool showLineThrough;
  final bool showUnderline;
  final Color? underlineOrLineColor;
  final double? letterSpacing;
  final bool softWrap;
  final TextOverflow? overflow;
  final bool firstUpperCaseWidget;
  final String fontFamily;

  TextStyle _textStyle(BuildContext context) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: fontStyle,
      fontSize: fontSize,
      color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      height: height,
      letterSpacing: letterSpacing,
      decoration: showLineThrough
          ? TextDecoration.lineThrough
          : showUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: underlineOrLineColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      firstUpperCaseWidget ? _capitalize(text) : text,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow:
      overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      style: _textStyle(context),
      textAlign: textAlign,
      textScaler: TextScaler.noScaling,
    );
  }

  String _capitalize(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
