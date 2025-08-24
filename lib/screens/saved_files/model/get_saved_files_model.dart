class GetSavedFilesModel {
  final int? statusCode;
  final ResponseData? response;
  final String? message;
  final bool? status;

  GetSavedFilesModel({
    this.statusCode,
    this.response,
    this.message,
    this.status,
  });

  factory GetSavedFilesModel.fromJson(Map<String, dynamic> json) {
    return GetSavedFilesModel(
      statusCode: json['statusCode'],
      response: json['response'] != null
          ? ResponseData.fromJson(json['response'])
          : null,
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'response': response?.toJson(),
      'message': message,
      'status': status,
    };
  }
}

class ResponseData {
  final Data? data;

  ResponseData({this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
    };
  }
}

class Data {
  final List<AutoList>? autolists;

  Data({this.autolists});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      autolists: json['autolists'] != null
          ? List<AutoList>.from(
              json['autolists'].map((x) => AutoList.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'autolists': autolists?.map((x) => x.toJson()).toList(),
    };
  }
}

class AutoList {
  final int? id;
  final int? userId;
  final String? title;
  final List<String>? items;

  AutoList({
    this.id,
    this.userId,
    this.title,
    this.items,
  });

  factory AutoList.fromJson(Map<String, dynamic> json) {
    return AutoList(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      items: json['items'] != null ? List<String>.from(json['items']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'items': items,
    };
  }
}
