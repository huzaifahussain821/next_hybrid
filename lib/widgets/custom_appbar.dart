import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/themes/app_sizer.dart';

import '../themes/app_theme.dart';
import '../utilities/app_assets_path.dart';
import 'custom_text_widget.dart';

class AppBarWidget {
  static placeholder() {
    return AppBar(
      backgroundColor: AppThemes.primaryColor,
      toolbarHeight: 0,
    );
  }

  static mainAppBar(String title,
      {bool? showNotificationIcon = false,
      Color? titleColor,
      BuildContext? contextHead}) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 60),
      child: Padding(
        padding: AppSizer.globalPadding,
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppThemes.transparentColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 35,
          leading: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(contextHead ?? context).openDrawer();
              },
              child: Container(
                  height: 1,
                  width: 1,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    color: AppThemes.errorColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AssetsPath.menuIcon,
                    scale: 3,
                  )),
            );
          }),
          centerTitle: true,
          titleSpacing: 0,
          title: CustomTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: AppThemes.appBarTextSize(),
            textColor: titleColor ?? AppThemes.white,
          ),
          actions: <Widget>[
            showNotificationIcon == true
                ? IconButton(
                    onPressed: () {
                      // Get.to(const NotificationView(), binding: NotificationBindings());
                    },
                    icon: Badge.count(
                      count: 3,
                      backgroundColor: AppThemes.errorColor,
                      child: Image.asset(
                        AssetsPath.notificationIcon,
                        scale: 1.9,
                      ),
                    ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  static backAppBar(String title,
      {Widget? titleWidget, Widget? actionWidget, Color? titleColor}) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 60),
      child: Padding(
        padding: AppSizer.globalPadding,
        child: AppBar(
          backgroundColor: AppThemes.transparentColor,
          leadingWidth: 35,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(2), // square with slight curve
                border: Border.all(color: AppThemes.black, width: 1),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: AppThemes.black,
                size: 20,
              ),
            ),
          ),

          // leading: GestureDetector(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Container(
          //       padding: EdgeInsets.zero,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         shape: BoxShape.circle,
          //         border: Border.all(color: AppThemes.black, width: 1),
          //       ),
          //       child: const Icon(
          //         Icons.arrow_back_ios_new,
          //         color: AppThemes.black,
          //         size: 15,
          //       )),
          // ),
          centerTitle: true,
          title: titleWidget ??
              CustomTextWidget(
                text: title,
                fontWeight: FontWeight.w500,
                textSize: AppThemes.normalTextSize(),
                textColor: titleColor ?? AppThemes.black,
              ),
          actions: [actionWidget ?? const SizedBox.shrink()],
        ),
      ),
    );
  }

  static WithoutBackAppBar(String title,
      {Widget? titleWidget, Widget? actionWidget, Color? titleColor}) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 60),
      child: Padding(
        padding: AppSizer.globalPadding,
        child: AppBar(
          backgroundColor: AppThemes.transparentColor,
          leadingWidth: 35,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: titleWidget ??
              CustomTextWidget(
                text: title,
                fontWeight: FontWeight.w500,
                textSize: AppThemes.normalTextSize(),
                textColor: titleColor ?? AppThemes.black,
              ),
          actions: [actionWidget ?? const SizedBox.shrink()],
        ),
      ),
    );
  }
}
