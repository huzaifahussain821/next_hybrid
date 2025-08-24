import 'dart:developer';
import 'package:get/get.dart';
import 'package:purpose_payment/api_services/auth_services.dart';
import 'package:purpose_payment/screens/login_view/views/signin_view.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';

class SettingsController extends GetxController {
  static SettingsController get to {
    try {
      return Get.find<SettingsController>();
    } catch (e) {
      return Get.put(SettingsController());
    }
  }

  var isLoading = false.obs;

  Future<void> logoutUser() async {
    try {
      isLoading.value = true;

      final response = await AuthServices.logout();

      if (response != null && response.status == true) {
        // ✅ Clear all saved preferences
        await prefs.clear();

        // 👉 If you want to keep dark mode setting, uncomment this
        // bool darkMode = AppPreferences.isDarkMode;
        // await prefs.clear();
        // AppPreferences.isDarkMode = darkMode;

        Get.offAll(() => SignInScreen());
      } else {
        log("Logout failed: ${response?.message ?? 'Unknown error'}");
        Get.snackbar("Error", response?.message ?? "Logout failed");
      }
    } catch (e) {
      log("Logout exception: $e");
      Get.snackbar("Error", "Something went wrong while logging out");
    } finally {
      isLoading.value = false;
    }
  }
}
