import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/api_services/auth_services.dart';
import 'package:purpose_payment/models/auth_model.dart';
import 'package:purpose_payment/screens/login_view/login_model.dart';
import 'package:purpose_payment/screens/otp_view/otp_view.dart';

class SignInController extends GetxController {
  var isSignedIn = false.obs;
  var selectedCode = "+1".obs;
  final phoneController = TextEditingController();

  void signInWithEmail() {
    // Handle email sign-in logic
    isSignedIn.value = true;
  }

  void signInWithPhone() {
    // Handle phone sign-in logic
    isSignedIn.value = true;
  }

  void signInWithGoogle() {
    // Handle Google sign-in logic
    isSignedIn.value = true;
  }

  void signInWithApple() {
    // Handle Apple sign-in logic
    isSignedIn.value = true;
  }

  //////////////////////////////////////////////
  var email = ''.obs;

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  //////////////////////////////////////////////
  var countryCode = '+1'.obs;
  var phoneNumber = ''.obs;

  void setCountryCode(String code) {
    countryCode.value = code;
  }

  void setPhoneNumber(String number) {
    phoneNumber.value = number;
  }
  //////////////////////////////////////////////

  //////////////////////////////////////////////

  var isLoading = false.obs;

  final emailController = TextEditingController();

  // Function to call login API
  Future<void> loginUser() async {
    if (emailController.text.isEmpty) {
      Get.snackbar("Error", "Please enter your email");
      return;
    }

    try {
      isLoading.value = true;

      final data = {
        "email": emailController.text.trim(),
        "device_type": "android", // hardcoded for now
        "device_token": "sasadsd", // replace with FCM token later
      };

      // Call API
      LoginModel? authResponse = await AuthServices.loginIn(data);

      if (authResponse != null && authResponse.status == true) {
        isSignedIn.value = true;

        // ✅ Navigate to OTP Screen and pass userId or email if needed
        Get.to(() => OtpView(
              userId: authResponse.response?.data?.userId ?? 0,
            ));
      } else {
        Get.snackbar("Error", authResponse?.message ?? "Login failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
