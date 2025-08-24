// import '../models/general_response_model.dart';
// import '../models/success_message_model.dart';
// import '../utilities/app_url.dart';

import 'package:purpose_payment/models/general_response_model.dart';
import 'package:purpose_payment/screens/login_view/login_model.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';
import 'package:purpose_payment/utilities/app_urls.dart';

import '../api_core/api_client.dart';

class AuthServices {
  static Future<LoginModel?> loginIn(Map<String, dynamic> data) async {
    final res = await ApiClient().post(AppUrls.loginApi, data: data);
    return LoginModel.fromJson(res.data);
  }

  // static Future<GeneralResponseModel?> signUp(Map<String, dynamic> data) async {
  //   final res = await ApiClient().post(AppUrls.signupApi, data: data);
  //   return GeneralResponseModel.fromJson(res.data);
  // }

  static Future<GeneralResponseModel?> sendOTP(
    Map<String, dynamic> data,
  ) async {
    final res = await ApiClient().post(AppUrls.sendOTPApi, data: data);
    return GeneralResponseModel.fromJson(res.data);
  }

  static Future<GeneralResponseModel?> resendOtp(
    Map<String, dynamic> data,
  ) async {
    final res = await ApiClient().post(AppUrls.resendOtpApi, data: data);
    return GeneralResponseModel.fromJson(res.data);
  }

  static Future<GeneralResponseModel?> logout() async {
    final res = await ApiClient().post(
      AppUrls.logoutApi,
      token: AppPreferences.authToken,
    );
    return GeneralResponseModel.fromJson(res.data);
  }
  // static Future<GeneralResponseModel?> resetPassword(
  //   Map<String, dynamic> data,
  // ) async {
  //   final res = await ApiClient().post(AppUrls.resetPasswordApi, data: data);
  //   return GeneralResponseModel.fromJson(res.data);
  // }

  // static Future<GeneralResponseModel?> deleteAccount(String userId) async {
  //   final url = AppUrls.deleteAccountApi.replaceAll("{id}", userId);
  //   final res = await ApiClient().delete(url);
  //   return GeneralResponseModel.fromJson(res.data);
  // }
}
