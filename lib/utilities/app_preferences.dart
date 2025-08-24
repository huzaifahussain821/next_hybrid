import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

initializePreferences() async {
  try {
    prefs = await SharedPreferences.getInstance();
  } catch (e) {
    log(e.toString());
  }
}

class AppPreferences {
  static set isDarkMode(bool isDarkMode) =>
      prefs.setBool('isDarkMode', isDarkMode);

  static bool get isDarkMode => prefs.getBool('isDarkMode') ?? false;

  static set authToken(String authToken) =>
      prefs.setString('authToken', authToken);

  static String get authToken => prefs.getString('authToken') ?? "";

  static set userId(String id) => prefs.setString('userId', id);

  static String get userId => prefs.getString('userId') ?? "";

  static set email(String email) => prefs.setString('email', email);

  static String get email => prefs.getString('email') ?? "";

  static set password(String password) => prefs.setString('password', password);

  static String get password => prefs.getString('password') ?? "";

  static set rememberMe(bool rememberMe) =>
      prefs.setBool('rememberMe', rememberMe);

  static bool get rememberMe => prefs.getBool('rememberMe') ?? false;

  static set isLogin(bool isLogin) => prefs.setBool('isLogin', isLogin);

  static bool get isLogin => prefs.getBool('isLogin') ?? false;

  static set loginData(Map<String, dynamic> value) =>
      prefs.setString('loginData', jsonEncode(value));

  static Map<String, dynamic> get loginData =>
      jsonDecode(prefs.getString('loginData') ?? "{}");

  static set isSocialLogin(bool isSocialLogin) =>
      prefs.setBool('isSocialLogin', isSocialLogin);

  static bool get isSocialLogin => prefs.getBool('isSocialLogin') ?? false;
}
