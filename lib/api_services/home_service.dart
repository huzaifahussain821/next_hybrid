
// import '../api_core/api_client.dart';
// import '../features/home/model/get_discovery_match_users_model.dart';
// import '../utilities/app_urls.dart';

// class HomeService {
//   static Future<GetDiscoveryMatchUsersModel> fetchUserMatches({
//     required String type,
//     required int limit,
//     required int page,
//   }) async {
//     final response = await ApiClient().get(
//       AppUrls.getDiscoveryOrMatchUsersApi,
//       queryParameters: {'type': type, 'limit': limit, 'page': page},
//     );
//     return GetDiscoveryMatchUsersModel.fromJson(response.data);
//   }
// }
