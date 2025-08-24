import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_button.dart';
import 'app_theme.dart';

class AppGlobals {
  ///
  /// VARIABLES
  ///
  static final GlobalKey<NavigatorState> appNavigationKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static bool isLogin = false;
  static String fcmToken = "";

  ///
  /// FUNCTIONS
  ///

  //static const _chars = '1234567890';
  static const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  static final Random _rnd = Random();

  static Future<bool> internetConnectivityStatus() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('Internet Status = Connected');
        return true;
      } else {
        debugPrint('Internet Status = Not Connected');
        return false;
      }
    } on SocketException catch (_) {
      debugPrint('Internet Status = Not Connected');
      return false;
    }
  }

  static String getInitials(String bankAccountName) =>
      bankAccountName.isNotEmpty
          ? bankAccountName
              .trim()
              .split(RegExp(' +'))
              .map((s) => s[0])
              .take(2)
              .join()
          : '';

  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  static DateTime parseToDateTime(
      String dateTime, String incomingFormat, String outgoingFormat) {
    var incomingDateTime = DateFormat(incomingFormat).parse(dateTime);
    var outgoingDateTime =
        DateFormat(outgoingFormat).parse(incomingDateTime.toString());
    return outgoingDateTime;
  }

  static showErrorSnackBar(
      {String? heading, required String message, bool closeDialog = false}) {
    if (Get.context == null) return;
    if (Get.isDialogOpen! && closeDialog) Get.back();
    Get.snackbar("Warning", message,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        maxWidth: 500,
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10));
  }

  static showSuccessSnackBar(
      {String? heading, required String message, int durationMilliSec = 1000}) {
    if (Get.context == null) return;
    Get.snackbar(heading ?? 'Success', message,
        colorText: AppThemes.white,
        backgroundColor: AppThemes.primaryColor,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(
          Icons.check_circle_sharp,
          color: AppThemes.successColor,
        ),
        duration: Duration(milliseconds: durationMilliSec));
  }

  static showSimpleDialog({
    required BuildContext context,
    required Widget heading,
    required Widget content,
    double? width,
    double? height,
    bool isBarrierDismissible = true,
  }) {
    showDialog(
      barrierDismissible: isBarrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppThemes.primaryColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: AppThemes.primaryColor,
              width: width ?? 500,
              height: height ?? 500,
              child: Column(
                children: [
                  heading,
                  Expanded(
                    child: content,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
        AlertDialog(
          title: Text(heading ?? "Error"),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: onTap ??
                  () {
                    Get.back();
                  },
              child: Text(
                btnText ?? "Ok",
                // style: AppThemes.lightTheme.textTheme.bodyMedium!
                //     .copyWith(color: AppThemes.secondaryBgColor)
              ),
            ),
          ],
        ),
        barrierDismissible: dismissible);
  }

  static deleteDialog({
    required BuildContext context,
    String? msg,
    String? btnText,
    required deleteBtnTap,
  }) {
    showSimpleDialog(
      width: 350,
      height: 250,
      context: context,
      heading: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10, right: 10),
            child: Image.asset(
              "assets/icons/close_circle.png",
            ),
          ),
        ),
      ),
      content: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const CircularProgressIndicator(
                  value: 1,
                  color: AppThemes.primaryColor,
                ),
                Image.asset(
                  "assets/icons/trash.png",
                )
              ],
            ),
            const Text(
              "Are you sure?",
              style: TextStyle(
                color: AppThemes.primaryColor,
              ),
            ),
            Text(
              msg ??
                  "Do you really want to delete this record? This process cannot be undone.",
              style: const TextStyle(
                color: AppThemes.greyColor,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomElevatedButton(
                      width: double.maxFinite,
                      onTap: deleteBtnTap,
                      text: 'Delete',
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: CustomElevatedButton(
                        width: double.maxFinite,
                        onTap: () {
                          Get.back();
                        },
                        text: 'Cancel',
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static String getTimeStamp({required String type}) {
    if (type.toLowerCase() == "tz") {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
          .format(DateTime.now().toUtc());
    } else if (type.toLowerCase() == "dt_name") {
      return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now().toUtc());
    } else if (type.toLowerCase() == "dt") {
      /* if(getCurrentLocale()){
        return DateFormat('dd-MM-yyyy hh:mm:ss').format(DateTime.now());
      }*/
      return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
    } else if (type.toLowerCase() == "dt2") {
      return DateFormat('dd/MMM/yyyy hh:mm:ss').format(DateTime.now());
    } else if (type.toLowerCase() == "dt_save") {
      return DateFormat('ddMMyyyy_hhmm').format(DateTime.now());
    } else {
      return "none";
    }
    // debugPrint(DateTime.now().toUtc().toIso8601String());
    // debugPrint(DateTime.now().toString());
    // debugPrint(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now().toUtc()));
  }

  static String convertTimeToLocal({required String utcTime}) {
    if (utcTime != "") {
      return DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(utcTime, true)
          .toLocal()
          .toString()
          .split(".")
          .first;
      // return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime.toLocal());
    }
    return "";
  }

  static String convertToHumanReadable(String text) {
    return text
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'),
            ' ') // Replace all non-alphanumeric characters with spaces
        .split(' ') // Split the string by spaces
        .where((word) =>
            word.isNotEmpty) // Remove any empty words caused by multiple spaces
        .map((word) =>
            word[0].toUpperCase() +
            word.substring(1).toLowerCase()) // Capitalize each word
        .join(' '); // Join the words back with a single space
  }

  static String getCurrencySymbolFromCode(String code) {
    var format = NumberFormat.simpleCurrency(
        locale: Platform.localeName, name: code.toUpperCase());
    return format.currencySymbol;
  }

  static showScaffold(String toastMsg) {
    ScaffoldMessenger.of(appNavigationKey.currentContext!).showSnackBar(
      SnackBar(content: Text(toastMsg)),
    );
  }

  static String timeAgo(String? productTime) {
    if (productTime == null) return "N/A"; // ✅ Handle null values

    DateTime productDateTime = DateTime.parse(productTime);
    Duration difference = DateTime.now().difference(productDateTime);

    if (difference.inSeconds < 60) {
      // return "${difference.inSeconds} sec ago";
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inHours > 24 && difference.inHours < 48) {
      return "yesterday";
    } else if (difference.inHours > 48) {
      return "${productDateTime.month}-${productDateTime.day}-${productDateTime.year}";
    } else {
      return "${(difference.inDays / 7).floor()} week${(difference.inDays / 7).floor() > 1 ? 's' : ''} ago";
    }
    // else if (difference.inDays < 30) {
    //   return "${(difference.inDays / 7).floor()} week${(difference.inDays / 7).floor() > 1 ? 's' : ''} ago";
    // } else if (difference.inDays < 365) {
    //   return "${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''} ago";
    // } else {
    //   return "${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''} ago";
    // }
  }
}
