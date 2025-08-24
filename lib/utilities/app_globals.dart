import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/utilities/app_theme.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class AppGlobals {
  static RxBool isDarkMode = false.obs;

  static showAlertDialog({
    String? heading,
    required String message,
    bool closeDialog = false,
    bool dismissible = false,
    String? btnText,
    VoidCallback? onTap,
  }) {
    if (Get.context == null) return;
    if (Get.isDialogOpen! && closeDialog) Get.back();
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(heading ?? 'Error'),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: CustomText(
              'Cancel',
              style: TextStyle(
                color:
                    AppGlobals.isDarkMode.value
                        ? AppColors.dark
                        : AppColors.lightColor,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: CustomText(
              'Ok',
              style: TextStyle(
                color:
                    AppGlobals.isDarkMode.value
                        ? AppColors.dark
                        : AppColors.lightColor,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      barrierDismissible: dismissible,
    );
  }
}
