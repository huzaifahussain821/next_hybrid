import 'package:get/get.dart';
import 'package:purpose_payment/api_services/auth_services.dart';
import 'package:purpose_payment/screens/dashboard/view/dashboard_view.dart';
import 'package:purpose_payment/screens/home/home_view.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';

class OtpController extends GetxController {
  // OTP fields
  var otpDigits = List.filled(6, '').obs;
  var textControllers = List.generate(6, (_) => TextEditingController());

  // State
  var isLoading = false.obs;
  var secondsLeft = 60.obs;
  var progress = 1.0.obs;
  Timer? _timer;
  var canResend = false.obs; // 👈 New flag

  // Set OTP digit
  void setOtpDigit(int index, String value) {
    otpDigits[index] = value;
  }

  // Get full OTP
  String get otp => otpDigits.join();

  // Timer start
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    secondsLeft.value = 60;
    progress.value = 1.0;
    canResend.value = false;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value > 0) {
        secondsLeft.value--;
        progress.value = secondsLeft.value / 60;
      } else {
        canResend.value = true; // 👈 enable resend
        timer.cancel();
      }
    });
  }

  // Call API
  Future<void> sendOtp(int userId) async {
    if (otp.length != 6) {
      Get.snackbar("Error", "Please enter complete OTP");
      return;
    }

    isLoading.value = true;
    try {
      final response = await AuthServices.sendOTP({
        "user_id": userId,
        "otp": otp,
      });

      if (response != null && response.status == true) {
        final authData = response.response?.data;
        if (authData != null) {
          final prefs = await SharedPreferences.getInstance();

          // Save token
          final token = authData.token ?? "";
          await prefs.setString('token', token);
          AppPreferences.authToken = token; 

          // Save user info
          final user = authData.user;
          if (user != null) {
            await prefs.setInt('user_id', user.id ?? 0);
            await prefs.setString('email', user.email ?? "");
            await prefs.setBool(
                'is_profile_complete', (user.isProfileComplete ?? 0) == 1);
          }

          // Navigate based on profile completion
          if ((authData.user?.isProfileComplete ?? 0) == 1) {
            Get.offAll(() => DashboardView());
          } else {
            Get.offAll(() => ProfileScreen(view: "create"));
          }
        }

        // if (authData != null) {
        //   final prefs = await SharedPreferences.getInstance();

        //   // Save token
        //   await prefs.setString('token', authData.token ?? "");

        //   // Save user info
        //   final user = authData.user;
        //   if (user != null) {
        //     await prefs.setInt('user_id', user.id ?? 0);
        //     await prefs.setString('email', user.email ?? "");
        //     await prefs.setBool(
        //         'is_profile_complete', (user.isProfileComplete ?? 0) == 1);
        //   }

        //   // Navigate based on profile completion
        //   if ((authData.user?.isProfileComplete ?? 0) == 1) {
        //     Get.offAll(() => DashboardView());
        //   } else {
        //     Get.offAll(() => ProfileScreen(view: "create"));
        //   }
        // }
      } else {
        Get.snackbar("Error", response?.message ?? "Verification failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Resend OTP
  Future<void> resendOtp(int userId) async {
    try {
      isLoading.value = true;
      final response = await AuthServices.resendOtp({
        "user_id": userId,
      });

      if (response != null && response.status == true) {
        Get.snackbar("Success", response.message ?? "OTP resent successfully");
        startTimer(); // restart timer after resend
      } else {
        Get.snackbar("Error", response?.message ?? "Failed to resend OTP");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var c in textControllers) {
      c.dispose();
    }
    super.onClose();
  }
}
