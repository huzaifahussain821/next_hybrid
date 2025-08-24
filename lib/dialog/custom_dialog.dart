import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/themes/app_sizer.dart';
import 'package:purpose_payment/utilities/app_assets_path.dart';

import '../themes/app_globals.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_widget.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String description;
  final double? height;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onClickedYes;
  final String? onClickedYesText;
  final Color? onClickedYesColor;
  final Color? onClickedYesTextColor;
  final VoidCallback? onClickedNo;
  final String? onClickedNoText;
  final String? paidAmount;

  final Color? onClickedNoColor;
  final Color? onClickedNoTextColor;

  const CustomDialog({super.key, required this.title, required this.description, this.onClickedYes, this.onClickedNo, this.icon, this.iconColor, this.onClickedYesText, this.onClickedNoText, this.height, this.onClickedYesColor, this.onClickedNoColor, this.onClickedYesTextColor, this.onClickedNoTextColor, this.paidAmount});

  @override
  State<CustomDialog> createState() => _CustomDialog();
}

class _CustomDialog extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    debugPrint("title: ${widget.title}");
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        content: Stack(
          clipBehavior: Clip.none, // Allows overflow
          alignment: Alignment.topCenter,
          children: [
            Container(
              // height: widget.height ?? 140,
              width: double.infinity,
              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage(AssetsPath.successBg), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.title != ""
                      ? CustomTextWidget(
                          text: widget.title,
                          fontWeight: FontWeight.w600,
                          textSize: AppThemes.headingSize(),
                        )
                      : const SizedBox.shrink(),
                  widget.title != "" ? const SizedBox(height: 5) : const SizedBox.shrink(),
                  widget.description != ""
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "You Earned ", style: AppThemes.hintTextStyle()),
                                  TextSpan(text: widget.paidAmount ?? "0", style: AppThemes.labelTextStyle()),
                                  TextSpan(text: "Points", style: AppThemes.hintTextStyle()),
                                ],
                              ),
                            ),
                            5.horizontalSpace,
                            Image.asset(
                              AssetsPath.coinIcon,
                              scale: 2.5,
                            )
                          ],
                        )
                      : const SizedBox.shrink(),
                  10.verticalSpace,
                  CustomTextWidget(
                    text: "You Paid",
                    maxLine: 5,
                    textSize: AppThemes.subHeadingSize(),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(color: AppThemes.secondaryColor.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: AppSizer.globalPadding,
                      child: CustomTextWidget(
                        text: "${widget.paidAmount ?? 0}",
                        maxLine: 5,
                        fontWeight: FontWeight.w700,
                        textSize: AppThemes.subHeadingSize(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  CustomElevatedButton(
                    isEnabled: true,
                    width: double.infinity,
                    text: "Home",
                    onTap: () {
                      Get.back();
                      Get.back();
                      // Get.offAll(const DashboardView(currentIndex: 0,));
                    },
                  ),
                  10.verticalSpace,
                  CustomTextWidget(
                    text: "Leaderboard Screen",
                    maxLine: 5,
                    fontWeight: FontWeight.w700,
                    textSize: AppThemes.subHeadingSize(),
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
            Positioned(
              top: -35, // Half of the icon overflow
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppThemes.primaryColor),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color:
                  //         Colors.black.withValues(alpha: 0.2), // Shadow color
                  //     spreadRadius: 4, // How much the shadow spreads
                  //     blurRadius: 10, // Softness of the shadow
                  //     offset: const Offset(0, 5), // Shadow position
                  //   ),
                  // ],
                ),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Image.asset(
                      AssetsPath.checkIcon,
                      scale: 2,
                    )),
              ),
            ),
          ],
        ),
        // actions: [
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       widget.onClickedNo != null
        //           ? CustomElevatedButton(
        //               height: 40,
        //               fontSize: 13,
        //               width: 100,
        //               borderRadius: 4,
        //               onTap: widget.onClickedNo,
        //               buttonColor: widget.onClickedNoColor ?? AppThemes.white,
        //               textColor: widget.onClickedNoTextColor ?? AppThemes.black,
        //               text: widget.onClickedNoText ?? "No",
        //             )
        //           : const SizedBox.shrink(),
        //       (widget.onClickedNo != null && widget.onClickedYes != null)
        //           ? const SizedBox(
        //               width: 10,
        //             )
        //           : const SizedBox.shrink(),
        //       widget.onClickedYes != null
        //           ? CustomElevatedButton(
        //               height: 40,
        //               fontSize: 13,
        //               width: 100,
        //               borderRadius: 4,
        //               borderColor: AppThemes.transparentColor,
        //               onTap: widget.onClickedYes,
        //               buttonColor:
        //                   widget.onClickedYesColor ?? AppThemes.errorColor,
        //               textColor:
        //                   widget.onClickedYesTextColor ?? AppThemes.white,
        //               text: widget.onClickedYesText ?? "No",
        //             )
        //           : const SizedBox.shrink(),
        //     ],
        //   )
        // ],
      ),
    );
  }
}

showCustomDialog({
  required String title,
  required String description,
  VoidCallback? onClickedYes,
  VoidCallback? onClickedNo,
  IconData? icon,
  Color? iconColor,
  String? onClickedYesText,
  String? onClickedNoText,
  double? height,
}) {
  showDialog(
    barrierDismissible: false,
    context: AppGlobals.appNavigationKey.currentContext!,
    builder: (BuildContext context) {
      return CustomDialog(
        title: title,
        description: description,
        onClickedYes: onClickedYes,
        onClickedNo: onClickedNo,
        icon: icon,
        iconColor: iconColor,
        onClickedYesText: onClickedYesText,
        onClickedNoText: onClickedNoText,
        height: height,
      );
    },
  );
}

showCustomBodyDialog(BuildContext context, {Widget? body, String? title}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppThemes.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: title ?? "",
                    textColor: AppThemes.black,
                    textSize: 1.1.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close_outlined,
                        size: 20,
                      )),
                ],
              ),
              body ?? const SizedBox(),
            ],
          ),
        ),
      );
    },
  );
}
