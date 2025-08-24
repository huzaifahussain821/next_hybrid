// import 'package:stumble/features/dilemma_requests/model/get_dilemma_questions_model.dart';
// import 'package:stumble/features/dilemma_requests/model/get_dilemma_score_model.dart';

// import '../features/dilemma_requests/model/get_dilemma_requests_model.dart';
// import '../models/general_response_model.dart';
// import '../utilities/app_urls.dart';
// import '../api_core/api_client.dart';

// class SettingsServices {
//   static Future<GetDilemmaRequestsModel> getDilemmaRequestsApi(
//       ) async {
//     final response = await ApiClient().get(
//         AppUrls.getDilemmaRequestsApi
//     );
//     return GetDilemmaRequestsModel.fromJson(response.data);
//   }


//   static Future<GeneralResponseModel?> sendDilemmaRequestsApi(
//       Map<String, dynamic> data,
//       ) async {
//     final res = await ApiClient().post(AppUrls.sentDilemmaRequestApi, data: data);
//     return GeneralResponseModel.fromJson(res.data);
//   }

//   static Future<GeneralResponseModel?> respondDilemmaRequestsApi(
//       Map<String, dynamic> data,
//       ) async {
//     final res = await ApiClient().post(AppUrls.respondDilemmaRequestApi, data: data);
//     return GeneralResponseModel.fromJson(res.data);
//   }

//   static Future<GetDilemmaQuestionsModel?> getDilemmaQuestionsApi(String id) async {
//     final url = AppUrls.getDilemmaQuestionsApi.replaceAll("{id}", id);
//     final response = await ApiClient().get(url);
//     return GetDilemmaQuestionsModel.fromJson(response.data);
//   }

//   static Future<GeneralResponseModel?> submitDilemmaAnswerApi({
//     required String matchId,
//     required Map<String, dynamic> data,
//   }) async {
//     final url = AppUrls.postDilemmaAnswersApi.replaceAll("{id}", matchId);
//     final response = await ApiClient().post(url, data: data);
//     return GeneralResponseModel.fromJson(response.data);
//   }

//   static Future<GetDilemmaScoreModel?> getDilemmaScoreApi(String userId) async {
//     final url = AppUrls.getDilemmaScoreApi.replaceAll("{id}", userId);
//     final res = await ApiClient().get(url);
//     return GetDilemmaScoreModel.fromJson(res.data);
//   }

// }
