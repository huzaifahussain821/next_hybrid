

import '../../../../utilities/app_exports.dart';

class DashboardController extends GetxController {
int? currentIndex=0;

  static DashboardController get to {
    try {
      return Get.find<DashboardController>();
    } catch (e) {
      return Get.put(DashboardController());
    }
  }
  // Rxn<AuthModel?> userdata = Rxn<AuthModel?>();

  // setUser(Map<String, dynamic> user) async {
  //   userdata.value = AuthModel.fromJson(user);
  //   // DashboardController.to.userdata.value = AuthModel.fromJson({"status": true, "code": 200, "message": "User Logged In", "data": UserPreferences.loginData});
  //   // UserPreferences.loginData = user;
  //   DashboardController.to.userdata.refresh();
  //   // await DashboardController.to.setUser({"status": true, "code": "SUCCESS", "message": "Already Logged In", "data": UserPreferences.loginData});

  //   log("wer${DashboardController.to.userdata.value?.data?.firstName}");
  //   log("userPreferenceDataDashboard${UserPreferences.loginData}");
  //   await prefs.reload();
  //   log("userdata----------------------${userdata.value?.data?.toJson()}");
  //   log("token----------------------${userdata.value?.data?.accessToken}");

  //   update();
  // }


}
