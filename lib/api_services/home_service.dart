import 'package:purpose_payment/models/general_response_model.dart';
import 'package:purpose_payment/screens/saved_files/model/get_saved_files_model.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';

import '../api_core/api_client.dart';
import '../utilities/app_urls.dart';

class HomeService {
  static Future<GeneralResponseModel?> createAutoListApi(
    Map<String, dynamic> data,
  ) async {
    final res = await ApiClient().post(AppUrls.createAutoListApi, data: data);
    return GeneralResponseModel.fromJson(res.data);
  }

  static Future<GetSavedFilesModel?> getSavedFilesApi() async {
    final res = await ApiClient().get(AppUrls.getSavedFilesApi);
    return GetSavedFilesModel.fromJson(res.data);
  }

  static Future<GeneralResponseModel?> deleteSavedFileApi(
      String id, String token) async {
    final endpoint =
        AppUrls.deleteSavedFileApi.replaceFirst("{id}", id.toString());

    final res = await ApiClient().delete(
      endpoint,
      token: token, // 🔑 pass token here
    );

    return GeneralResponseModel.fromJson(res.data);
  }
}
