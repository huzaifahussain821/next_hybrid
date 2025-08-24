class AuthModel {
  final int? statusCode;
  final AuthResponse? response;
  final String? message;
  final bool? status;

  AuthModel({
    this.statusCode,
    this.response,
    this.message,
    this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      statusCode: json['statusCode'],
      response: json['response'] != null
          ? AuthResponse.fromJson(json['response'])
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

class AuthResponse {
  final AuthData? data;

  AuthResponse({this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: json['data'] != null ? AuthData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
    };
  }
}

class AuthData {
  final String? token;
  final User? user;

  AuthData({this.token, this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      token: json['token'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user?.toJson(),
    };
  }
}

class User {
  final int? id;
  final String? otp;
  final String? role;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? emailVerifiedAt;
  final String? profileImage;
  final String? isoCode;
  final String? countryCode;
  final String? phoneNumber;
  final String? bio;
  final String? language;
  final int? isSubscribed;
  final int? trial;
  final String? deviceToken;
  final int? isSocial;
  final String? userSocialToken;
  final String? userSocialType;
  final int? isProfileComplete;
  final int? isBlocked;
  final int? isApproved;
  final int? isActive;
  final String? rating;
  final int? notifications;
  final String? customerId;
  final String? cardId;
  final int? isCard;
  final String? accountNumber;
  final int? merchantAccount;
  final String? deleteReason;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.otp,
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.profileImage,
    this.isoCode,
    this.countryCode,
    this.phoneNumber,
    this.bio,
    this.language,
    this.isSubscribed,
    this.trial,
    this.deviceToken,
    this.isSocial,
    this.userSocialToken,
    this.userSocialType,
    this.isProfileComplete,
    this.isBlocked,
    this.isApproved,
    this.isActive,
    this.rating,
    this.notifications,
    this.customerId,
    this.cardId,
    this.isCard,
    this.accountNumber,
    this.merchantAccount,
    this.deleteReason,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      otp: json['otp'],
      role: json['role'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      profileImage: json['profile_image'],
      isoCode: json['iso_code'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      bio: json['bio'],
      language: json['language'],
      isSubscribed: json['is_subscribed'],
      trial: json['trial'],
      deviceToken: json['device_token'],
      isSocial: json['is_social'],
      userSocialToken: json['user_social_token'],
      userSocialType: json['user_social_type'],
      isProfileComplete: json['is_profile_complete'],
      isBlocked: json['is_blocked'],
      isApproved: json['is_approved'],
      isActive: json['is_active'],
      rating: json['rating'],
      notifications: json['notifications'],
      customerId: json['customer_id'],
      cardId: json['card_id'],
      isCard: json['is_card'],
      accountNumber: json['account_number'],
      merchantAccount: json['merchant_account'],
      deleteReason: json['delete_reason'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'otp': otp,
      'role': role,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'profile_image': profileImage,
      'iso_code': isoCode,
      'country_code': countryCode,
      'phone_number': phoneNumber,
      'bio': bio,
      'language': language,
      'is_subscribed': isSubscribed,
      'trial': trial,
      'device_token': deviceToken,
      'is_social': isSocial,
      'user_social_token': userSocialToken,
      'user_social_type': userSocialType,
      'is_profile_complete': isProfileComplete,
      'is_blocked': isBlocked,
      'is_approved': isApproved,
      'is_active': isActive,
      'rating': rating,
      'notifications': notifications,
      'customer_id': customerId,
      'card_id': cardId,
      'is_card': isCard,
      'account_number': accountNumber,
      'merchant_account': merchantAccount,
      'delete_reason': deleteReason,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
