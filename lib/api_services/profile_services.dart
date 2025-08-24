// import 'package:stumble/features/matched_listing/model/get_matched_listing_model.dart';
// import 'package:stumble/features/more_information/model/get_interests_model.dart';
// import 'package:stumble/features/more_information/model/get_profile_model.dart';
// import 'package:stumble/features/my_profile/model/get_all_gallery_images_model.dart';
// import 'package:stumble/features/my_profile/model/upload_media_model.dart';
// import 'package:stumble/features/others_profile/model/get_all_images_by_id_model.dart';
// import 'package:stumble/features/select_your_avatar_view/model/get_all_avatars_model.dart';
// import 'package:stumble/models/upload_media_model.dart';
// import '../models/general_response_model.dart';
// import '../utilities/app_exports.dart';
// import '../utilities/app_urls.dart';
// import '../api_core/api_client.dart';
// import 'package:dio/dio.dart' as dio;
// import 'dart:io';
// import 'package:mime/mime.dart';
// import 'package:http_parser/http_parser.dart' as http_parser;

import 'package:dio/dio.dart';
import 'package:purpose_payment/api_core/api_client.dart';
import 'package:purpose_payment/models/auth_model.dart';
import 'package:purpose_payment/models/general_response_model.dart';
import 'package:purpose_payment/screens/edit_profile/model/get_profile_model.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/utilities/app_urls.dart';

class ProfileServices {
  static final Dio _dio = Dio();

  static Future<AuthModel?> completeProfileApi(
      Map<String, dynamic> data) async {
    try {
      // 🔑 Get token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      print("🔑 Token used: $token");

      final response = await _dio.post(
        "https://server1.appsstaging.com/3559/Next/public/api/profile/complete",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      print("STATUS CODE : ${response.statusCode}");
      print("RESPONSE : ${response.data}");

      return AuthModel.fromJson(response.data);
    } catch (e) {
      print("Profile API Error: $e");
      return null;
    }
  }

    static Future<GetProfileModel?> getProfileApi() async {
    final res = await ApiClient().get(AppUrls.getProfileApi);
    return GetProfileModel.fromJson(res.data);
  }
}
//   static Future<GetAllAvatarsModel?> getAllAvatars() async {
//     final res = await ApiClient().get(AppUrls.getAllAvatarsApi);
//     return GetAllAvatarsModel.fromJson(res.data);
//   }

//   static Future<GetAllAvatarsModel?> setAvatar(
//     Map<String, dynamic> data,
//   ) async {
//     final res = await ApiClient().put(AppUrls.setAvatarApi, data: data);
//     return GetAllAvatarsModel.fromJson(res.data);
//   }

//   static Future<GetProfileModel?> completeProfile(
//     Map<String, dynamic> data,
//   ) async {
//     final res = await ApiClient().put(AppUrls.completeProfileApi, data: data);
//     return GetProfileModel.fromJson(res.data);
//   }

//   static Future<GetInterestsModel?> getInterestsApi() async {
//     final res = await ApiClient().get(AppUrls.getInterestsApi);
//     return GetInterestsModel.fromJson(res.data);
//   }

//   static Future<GetProfileModel?> getProfileByIdApi(String userId) async {
//     final url = AppUrls.getProfileByIdApi.replaceAll("{id}", userId);
//     final res = await ApiClient().get(url);
//     return GetProfileModel.fromJson(res.data);
//   }



//   static Future<GetMatchedListingModel?> getMatchedListingApi() async {
//     final res = await ApiClient().get(AppUrls.getMatchedListingApi);
//     return GetMatchedListingModel.fromJson(res.data);
//   }

//   static Future<GeneralResponseModel?> postImageToProfile(
//     Map<String, dynamic> data,
//   ) async {
//     final res = await ApiClient().post(
//       AppUrls.postImageToProfileApi,
//       data: data,
//     );
//     return GeneralResponseModel.fromJson(res.data);
//   }




//   static Future<UploadMultipleMedialModel?> uploadMultipleImages(List<File> files) async {
//     try {
//       final multipartFiles = await Future.wait(
//         files.map((file) async {
//           final fileName = file.path.split('/').last;
//           final mimeType = lookupMimeType(file.path) ?? 'image/jpeg';
//           final mimeParts = mimeType.split('/');

//           return await dio.MultipartFile.fromFile(
//             file.path,
//             filename: fileName,
//             contentType: http_parser.MediaType(mimeParts[0], mimeParts[1]),
//           );
//         }),
//       );

//       final formData = dio.FormData.fromMap({
//         'files': multipartFiles,
//       });

//       final res = await ApiClient().post(
//         AppUrls.uploadMultipleImages,
//         data: formData,
//         isFormData: true,
//       );

//       final raw = res.data;

//       List<dynamic> dataList;
//       bool? status;
//       String? code;
//       String? message;

//       if (raw is Map<String, dynamic>) {
//         status = raw['status'] as bool?;
//         code = raw['code'] as String?;
//         message = raw['message'] as String?;
//         dataList = (raw['data'] as List?) ?? const [];
//       } else if (raw is List) {
//         dataList = raw;
//       } else {
//         throw Exception('Unexpected response shape from uploadMultipleImages');
//       }

//       final items = dataList.map((e) {
//         final m = (e is Map<String, dynamic>) ? e : Map<String, dynamic>.from(e as Map);
//         return UploadMultipleMedialModelData.fromJson(m);
//       }).toList();
//       return UploadMultipleMedialModel(
//         status: status ?? true,
//         code: code,
//         message: message,
//         data: items,
//       );
//     } catch (e) {
//       debugPrint("uploadMultipleImages error: $e");
//       return null;
//     }
//   }


//   static Future<GetAllGalleryImagesModel?> getAllGalleryImagesApi() async {
//     final res = await ApiClient().get(AppUrls.getAllGalleryImages);
//     return GetAllGalleryImagesModel.fromJson(res.data);
//   }

//   static Future<GetAllGalleryImagesByIdModel?> getAllImagesByIdApi(String userId) async {
//     final res = await ApiClient().get(
//       "${AppUrls.getAllGalleryImagesById}?user_id=$userId",
//     );
//     return GetAllGalleryImagesByIdModel.fromJson(res.data);
//   }


// }
