import '../utilities/app_exports.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final int? maxLine;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextStyle? style;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 1,
    this.maxLine = 1,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: style ??
          TextStyle(
              color: color ?? AppThemes.primaryColor,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontFamily: AppThemes.fontFamily,
              letterSpacing: 0),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      softWrap: true,
      textScaler: TextScaler.linear(fontSize?.sp ?? 1),
      selectionColor: AppThemes.greyColor,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
