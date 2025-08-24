// import 'package:stumble/features/d-b-i/model/get_demographics_dropdown_model.dart';
// import 'package:stumble/features/d-b-i/model/get_score_model.dart';
// import 'package:stumble/models/auth_model.dart';
// import 'package:stumble/models/onboarding_questions_model.dart';
// import 'package:stumble/utilities/app_urls.dart';

// import '../api_core/api_client.dart';

// class DemographicsService {
//   static Future<GetDemographicsDropdownModel?> getDemographicsDropdown() async {
//     final res = await ApiClient().get(AppUrls.getDemographicsDropdownApi);
//     return GetDemographicsDropdownModel.fromJson(res.data);
//   }
//   static Future<AuthModel?> onBoarding(Map<String, dynamic> data) async {
//     final res = await ApiClient().post(AppUrls.onboarding, data: data);
//     return AuthModel.fromJson(res.data);
//   }
//   static Future<OnboardingQuestionsModel?> onBoardingQuestions(Map<String, dynamic> queryParams) async {
//     final res = await ApiClient().get(AppUrls.onboardingQuestions, queryParameters: queryParams);
//     return OnboardingQuestionsModel.fromJson(res.data);
//   }
//   static Future<OnboardingQuestionsModel?> answerToBareMinimum(Map<String, dynamic> data) async {
//     final res = await ApiClient().post(AppUrls.answerToBareMinimum, data: data);
//     return OnboardingQuestionsModel.fromJson(res.data);
//   }
//   static Future<GetScoreModel?> getUserScore(String userId) async {
//     final url = AppUrls.getScoreApi.replaceAll("{id}", userId);
//     final res = await ApiClient().get(url);
//     return GetScoreModel.fromJson(res.data);
//   }

// }