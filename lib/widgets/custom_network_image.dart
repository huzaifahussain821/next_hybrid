import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purpose_payment/utilities/app_assets_path.dart';

import '../themes/app_theme.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.errorText,
    this.height = 40,
    this.width = 40,
    this.showInCircle = false,
    this.bgColor,
    this.fontColor,
    this.fontSize,
    this.fit = BoxFit.cover,
  });

  final String? imageUrl;
  final String? errorText;
  final double? height;
  final double? width;
  final bool showInCircle;
  final Color? bgColor;
  final Color? fontColor;
  final double? fontSize;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: showInCircle ? null : BorderRadius.circular(8),
            shape: showInCircle ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        placeholder: (context, url) => const CupertinoActivityIndicator(),
        errorWidget: (context, url, error) => errorText != null
            ? ImagePlaceHolder(
                bgColor: bgColor,
                fontColor: fontColor,
                fontSize: fontSize,
                text: errorText!,
              )
            : SizedBox(width: width, height: height, child:Image.asset(AssetsPath.emptyImage) ),
      ),
    );
  }
}

class HalfHollowRingPainter extends CustomPainter {
  /*
                        CustomPaint(
                          painter: HalfHollowRingPainter(
                            startAngle: math.pi * 4 / 3, //240 degrees
                            sweepAngle: math.pi * 4 / 3,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: CustomNetworkImage(
                              imageUrl: appGlobal.userDetails?.user?.profile,
                              errorText: appGlobal.userDetails?.user?.fullName?.getInitials,
                              height: 80,
                              width: 80,
                              bgColor: AppTheme.lightColor,
                              fontColor: AppTheme.primaryColor,
                              fontSize: 24,
                              showInCircle: true,
                            ),
                          ),
                        ),
  */
  // startAngle: 8.283185307179586,
  // endAngle: 4.35238898038469,
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;
  final Color color;

  HalfHollowRingPainter({
    this.strokeWidth = 4,
    required this.startAngle,
    required this.sweepAngle,
    this.color = AppThemes.primaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.shortestSide / 2);
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(HalfHollowRingPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth || oldDelegate.startAngle != startAngle || oldDelegate.sweepAngle != sweepAngle || oldDelegate.color != color;
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
    required this.text,
    this.radius = 20,
    this.fontSize,
    this.bgColor,
    this.fontColor,
    this.padding,
  });

  final String text;
  final Color? bgColor;
  final Color? fontColor;
  final double radius;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: CircleAvatar(
          radius: radius,
          backgroundColor: bgColor ?? AppThemes.primaryColor,
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: fontColor ?? AppThemes.primaryColor,
                  fontSize: fontSize,
                ),
          )),
    );
  }
}
