// class GeneralResponseModel {
//   bool? status;
//   int? statusCode;
//   String? code;
//   String? message;
//   ResponseData? response;

//   GeneralResponseModel({
//     this.status,
//     this.statusCode,
//     this.code,
//     this.message,
//     this.response,
//   });

//   GeneralResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     statusCode = json['statusCode'];
//     code = json['code']?.toString();
//     message = json['message']?.toString();
//     response = json['response'] != null ? ResponseData.fromJson(json['response']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['status'] = status;
//     data['statusCode'] = statusCode;
//     data['code'] = code;
//     data['message'] = message;
//     if (response != null) {
//       data['response'] = response!.toJson();
//     }
//     return data;
//   }
// }

// class ResponseData {
//   ResponseInnerData? data;

//   ResponseData({this.data});

//   ResponseData.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? ResponseInnerData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class ResponseInnerData {
//   String? token;
//   User? user;

//   ResponseInnerData({this.token, this.user});

//   ResponseInnerData.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['token'] = token;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? email;
//   int? isProfileComplete;

//   User({this.id, this.email, this.isProfileComplete});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     isProfileComplete = json['is_profile_complete'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['email'] = email;
//     data['is_profile_complete'] = isProfileComplete;
//     return data;
//   }
// }
class GeneralResponseModel {
  bool? status;
  int? statusCode;
  String? code;
  String? message;
  ResponseData? response;

  GeneralResponseModel({
    this.status,
    this.statusCode,
    this.code,
    this.message,
    this.response,
  });

  GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    code = json['code']?.toString();
    message = json['message']?.toString();
    response = json['response'] != null
        ? ResponseData.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class ResponseData {
  ResponseInnerData? data;

  ResponseData({this.data});

  ResponseData.fromJson(dynamic json) {
    // Handle both Map and List (like in logout response)
    if (json['data'] is Map<String, dynamic>) {
      data = ResponseInnerData.fromJson(json['data']);
    } else {
      data = null; // [] or null
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ResponseInnerData {
  String? token;
  User? user;

  ResponseInnerData({this.token, this.user});

  ResponseInnerData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  int? isProfileComplete;

  User({this.id, this.email, this.isProfileComplete});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    isProfileComplete = json['is_profile_complete'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['is_profile_complete'] = isProfileComplete;
    return data;
  }
}
