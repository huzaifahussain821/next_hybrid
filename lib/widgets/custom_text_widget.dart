import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final double? textSize;
  final int? maxLine;
  final double? height;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;

  const CustomTextWidget({
    super.key,
    this.text,
    this.textSize = 0.9,
    this.maxLine = 1,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.overflow,
    this.textStyle,
    this.textDecoration,
    this.height,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: textStyle ??
          TextStyle(
              // height: 1.3,
              // fontSize: textSize?.sp
              color: textColor ?? AppThemes.primaryColor,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontFamily: AppThemes.fontFamily,
              decoration: textDecoration ?? TextDecoration.none,
              decorationColor: textColor ?? AppThemes.primaryColor,
              fontStyle: fontStyle ?? FontStyle.normal,
              letterSpacing: 0.3),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLine,
      softWrap: true,
      textScaler: TextScaler.linear(textSize!),
      selectionColor: AppThemes.primaryLightColor,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
