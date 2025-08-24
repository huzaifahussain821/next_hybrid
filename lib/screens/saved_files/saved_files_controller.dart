import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/api_services/home_service.dart';
import 'package:purpose_payment/screens/saved_files/model/get_saved_files_model.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';

class SavedFilesController extends GetxController {
  var isLoading = false.obs;
  var savedFiles = <AutoList>[].obs; // list of saved files (autolists)
  @override
  void onInit() {
    super.onInit();
    fetchSavedFiles(); // ✅ call here only once
  }

  /// Fetch saved files
  Future<void> fetchSavedFiles() async {
    try {
      isLoading.value = true;
      final res = await HomeService.getSavedFilesApi();
      if (res != null && res.response?.data?.autolists != null) {
        savedFiles.assignAll(res.response!.data!.autolists!);
      } else {
        savedFiles.clear();
      }
    } catch (e) {
      savedFiles.clear();
      print("Error fetching saved files: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteFile(String id) async {
    try {
      // get token from your preferences or login controller
      String? token = AppPreferences.authToken;

      if (token.isEmpty) {
        Get.snackbar(
          "Error",
          "Session expired. Please login again.",
        );
        return;
      }

      final response = await HomeService.deleteSavedFileApi(id, token);

      if (response != null && response.status == true) {
        await fetchSavedFiles();

        Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          "Success",
          "File deleted successfully",
        );
        // optionally refresh your list here
      } else {
        Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          "Error",
          response?.message ?? "Delete failed",
        );
      }
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        "Error",
        "Something went wrong: $e",
      );
    }
  }
}
