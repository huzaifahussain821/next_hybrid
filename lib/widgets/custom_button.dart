import 'package:purpose_payment/utilities/app_exports.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.height = 45,
    this.width = 140,
    this.fontSize = 16,
    this.onTap,
    this.padding,
    this.iconImage,
    this.isEnabled = true,
    this.buttonColor,
    this.textColor,
    this.borderColor = AppThemes.primaryColor,
    this.borderRadius,
    this.icon,
  });

  final double? height;
  final double? width;
  final double? fontSize;
  final String text;
  final String? iconImage;
  final Color? buttonColor;
  final Color borderColor;
  final double? borderRadius;
  final Color? textColor;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Icon? icon;

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isEnabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          backgroundColor: buttonColor ?? AppThemes.primaryColor,
          disabledBackgroundColor: AppThemes.borderColor,
          foregroundColor: AppThemes.lightGreyColor,
          elevation: 0,
          overlayColor: AppThemes.grey100Color,
          shadowColor: borderColor.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color:buttonColor?? AppThemes.grey200Color,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 10),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (iconImage != null) Image.asset(iconImage!,scale: 2.5,),
            if (icon != null||iconImage != null)
              const SizedBox(
                width: 10,
              ),
            // Text(
            //   text,
            //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //         color: textColor ?? AppThemes.white,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w500,
            //       ),
            // ),
            CustomTextWidget(
              text: text,
              textColor:isEnabled? textColor ?? AppThemes.white:AppThemes.grey300Color,
              fontWeight: FontWeight.w600,
              textSize: 1.sp,
            )
          ],
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final double? width;
  final double? height;

  const CustomOutlineButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height = 44,
    this.fontSize = 14,
    this.bgColor = AppThemes.primaryColor,
    this.textColor = AppThemes.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1.2, color: AppThemes.primaryColor)),
        child: Text(title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
