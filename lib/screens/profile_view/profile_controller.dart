import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purpose_payment/screens/edit_profile/model/get_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:purpose_payment/api_services/profile_services.dart';
import 'package:purpose_payment/screens/dashboard/view/dashboard_view.dart';

class ProfileController extends GetxController {
  // Text controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  // Profile image
  final profileImage = Rx<File?>(null);

  // Loader state
  final isLoading = false.obs;

  // Pick image
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

// Complete profile API call
  Future<void> completeProfile() async {
    try {
      isLoading.value = true;

      final Map<String, dynamic> data = {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "email": emailController.text,
        "profile_image": profileImage.value?.path ?? "",
        "iso_code": "US",
        "country_code": "+1",
        "phone_number": phoneController.text,
        "bio": bioController.text,
      };

      final response = await ProfileServices.completeProfileApi(data);

      if (response != null) {
        if (response.status == true) {
          final authData = response.response?.data;

          if (authData != null) {
            final prefs = await SharedPreferences.getInstance();

            // await prefs.setString("token", authData.token ?? "");
            log("Before Saving: ${prefs.getString("token")}");
            log("New token from API: ${authData.token}");

            if (authData.token != null && authData.token!.isNotEmpty) {
              await prefs.setString("token", authData.token!);
              log("Token Updated: ${authData.token}");
            } else {
              log("Token not updated, keeping old token.");
            }

            final user = authData.user;
            if (user != null) {
              await prefs.setInt("user_id", user.id ?? 0);
              await prefs.setString("email", user.email ?? "");
              await prefs.setBool(
                  "is_profile_complete", (user.isProfileComplete ?? 0) == 1);
            }

            Get.snackbar(
                "Success", response.message ?? "Profile created successfully");

            Get.offAll(() => DashboardView());
          }
        } else {
          Get.snackbar("Error", response.message ?? "Failed to create profile");
        }
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

///////////////////////////////////// get profile ////////////////////////////////////////
  var profile = Rxn<GetProfileModel>();
  Future<void> fetchProfile({bool setControllers = false}) async {
    try {
      isLoading.value = true;

      final result = await ProfileServices.getProfileApi();
      if (result != null) {
        profile.value = result;

        if (setControllers && result.response?.data != null) {
          firstNameController.text = result.response?.data?.firstName ?? "";
          lastNameController.text = result.response?.data?.lastName ?? "";
          emailController.text = result.response?.data?.email ?? "";
          phoneController.text = result.response?.data?.phoneNumber ?? "";
          bioController.text = result.response?.data?.bio ?? "";
          // For image, store the URL to show in UI
          if (result.response?.data?.profileImage != null) {
            profileImage.value = File(result.response!.data!.profileImage!);
            // ⚠️ If backend gives only URL, store it separately for UI display
          }
        }
      } else {
        Get.snackbar("Error", "Failed to fetch profile data");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch profile function
  // Future<void> fetchProfile() async {
  //   try {
  //     isLoading.value = true;

  //     final result = await ProfileServices.getProfileApi();
  //     if (result != null) {
  //       profile.value = result;
  //     } else {
  //       Get.snackbar("Error", "Failed to fetch profile data");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Something went wrong: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Debug method
  void updateProfile() {
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Phone: ${phoneController.text}");
    print("Email: ${emailController.text}");
    print("Bio: ${bioController.text}");
    print("Image Path: ${profileImage.value?.path}");
  }
}
