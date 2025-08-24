


import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';

import '../models/auth_model.dart';

class DashboardController extends GetxController {
  int? currentIndex=0;

  static DashboardController get to {
    try {
      return Get.find<DashboardController>();
    } catch (e) {
      return Get.put(DashboardController());
    }
  }
  Rxn<AuthModel?> userdata = Rxn<AuthModel?>();

  setUser(Map<String, dynamic> user) async {
    userdata.value = AuthModel.fromJson(user);
    // DashboardController.to.userdata.value = AuthModel.fromJson({"status": true, "code": 200, "message": "User Logged In", "data": UserPreferences.loginData});
    // UserPreferences.loginData = user;
    DashboardController.to.userdata.refresh();
    // await DashboardController.to.setUser({"status": true, "code": "SUCCESS", "message": "Already Logged In", "data": UserPreferences.loginData});

    // log("wer${DashboardController.to.userdata.value?.data?.user?.name}");
    log("userPreferenceDataDashboard${AppPreferences.loginData}");
    await prefs.reload();
    // log("userdata----------------------${userdata.value?.data?.toJson()}");
    // log("token----------------------${userdata.value?.data?.accessToken}");

    update();
  }


}
