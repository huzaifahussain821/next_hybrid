import 'package:flutter/material.dart';

class AppConstants {
  // Private Constructor to Prevent Instantiation
  AppConstants._();
  // Static Constant Fields
  static const double padding = 15;
  static const String appLogo = 'assets/images/appLogo.png';
  static const String appIconLogo = 'assets/images/logo1.png';
  static const String mapKey = 'AIzaSyCgGMfotQ5FOxa-5TgGbbVYxKJx2wa2LMs';
  static const String animatedAppLogo = 'assets/logo/mainLogo.png';
  // text-fields input whitelisting
  static const Pattern emailFilterPattern = r'[a-zA-Z0-9@._-]';
  static const Pattern passwordFilterPattern =
      r'[a-zA-Z0-9!#\$%^&*()=+~`<>,/?:;"|\\@._-]';
  static const Pattern nameFilterPattern = r'[a-zA-Z]+|\s';
  static const EdgeInsets globalPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 10);
}
