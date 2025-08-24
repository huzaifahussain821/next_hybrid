import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  AppThemes._();

  static const String fontFamily = 'Zekton';

  static const Color primaryColor = Color(0xFFFDF3E6);
  static const Color secondaryColor = Color(0xFF404040);
  static const Color borderColor = Color(0xFFEDEDED);
  static const Color tertiaryColor = Color(0xFF0C4E8A);
  static const Color transparentColor = Colors.transparent;
  static const Color backgroundColor = Color(0xFFF4F0E9);
  static const Color headingTextColor = Color(0xFF171717);
  static const Color labelTextColor = Color(0xFF171717);
  static const Color titleTextColor = Color(0xFF171717);
  static const Color hintTextColor = Color(0xFF9A9A9A);
  static const Color disabledButtonColor = Color(0xFFC3C9E8);
  static const Color primaryLightColor = Color(0xFF79d2f6);
  static const Color successColor = Color(0xFF1B9E47);
  static const Color errorColor = Color(0xFFED2D31);
  static const Color greyColor = Color(0xFF70787D);
  static const Color greyTextColor = Color(0xFF404040);
  static const Color lightGreyColor = Color(0xFFE7E7ED);
  static const Color darkGreyColor = Color(0xFF4b4748);
  static const Color baseGreyColor = Color(0xFFE7EDF3);
  static const Color grey700Color = Color(0xFF1E1A1B);
  static const Color grey400Color = Color(0xFF747273);
  static const Color grey450Color = Color(0xFF9A9FA5);
  static const Color grey300Color = Color(0xFFa09f9f);
  static const Color grey200Color = Color(0xFFcac9c9);
  static const Color grey100Color = Color(0xFFe9e9e9);
  static const Color lightBlue = Color(0xFFE2EFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color yellow = Color(0xFFFBC02D);
  static const Color orange = Color(0xFFFB9D19);

  static const Color cardBorderColor = Color(0xffEDEDED);

  static headingSize() => 1.3.sp;

  static subHeadingSize() => 0.9.sp;

  static normalTextSize() => 0.8.sp;

  static appBarTextSize() => 0.75.sp;

  static drawerTextSize() => 0.75.sp;

  static headingTextStyle() => TextStyle(
      fontFamily: fontFamily,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: headingTextColor);

  static subHeadingTextStyle() => TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: titleTextColor);

  static titleTextStyle() => TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: titleTextColor);

  static labelTextStyle() => TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: primaryColor);

  static hintTextStyle() => TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: secondaryColor);

  static buttonTextStyle() => TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  /// Static Colors
  // static const Color primaryColor = Color(0xFF0c4e8a);

  /// Gradient Colors
  static List<Color> primaryGradient = [
    primaryColor,
    primaryColor,
  ];

  /// Theme Date
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    // dividerTheme: const DividerThemeData(color: Colors.transparent),
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: primaryColor,
    //   primary: primaryColor,
    //   secondary: secondaryColor,
    //   surface: lightColor,
    //   error: errorColor,
    // ),
    // bottomSheetTheme: const BottomSheetThemeData(
    //   surfaceTintColor: AppThemes.lightColor,
    //   backgroundColor: AppThemes.lightColor,
    //   modalBackgroundColor: AppThemes.lightColor,
    // ),
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: lightColor,
    //   elevation: 0,
    //   centerTitle: false,
    //   scrolledUnderElevation: 0,
    // ),
    // scaffoldBackgroundColor: AppThemes.lightColor,
    // canvasColor: AppThemes.lightColor,
    // useMaterial3: true,
    // fontFamily: 'WorkSans',
    // textTheme: TextTheme(
    //   headlineLarge: TextStyle(
    //     fontSize: 64.sp,
    //     fontWeight: FontWeight.w900,
    //     fontFamily: "WorkSans",
    //     color: darkColor,
    //   ),
    //   headlineMedium: TextStyle(
    //     fontSize: 40.sp,
    //     fontWeight: FontWeight.w700,
    //     fontFamily: "WorkSans",
    //     color: darkColor,
    //     // height: 1,
    //   ),
    //   headlineSmall: TextStyle(
    //     fontSize: 24.sp,
    //     fontWeight: FontWeight.w500,
    //     color: darkColor,
    //   ),
    //   titleLarge: TextStyle(
    //     fontSize: 22.sp,
    //     fontWeight: FontWeight.w500,
    //     color: darkColor,
    //   ),
    //   titleMedium: TextStyle(
    //     fontSize: 16.sp,
    //     fontWeight: FontWeight.w500,
    //     letterSpacing: 0.15,
    //     color: darkColor,
    //   ),
    //   bodyLarge: TextStyle(
    //     fontSize: 16.sp,
    //     fontWeight: FontWeight.normal,
    //     letterSpacing: 0.1,
    //     color: darkColor,
    //   ),
    //   bodyMedium: TextStyle(
    //     fontSize: 14.sp,
    //     fontWeight: FontWeight.w500,
    //     letterSpacing: 0.1,
    //     height: 1.4,
    //     //20px
    //     color: darkColor,
    //   ),
    //   bodySmall: TextStyle(
    //     fontSize: 12.sp,
    //     fontWeight: FontWeight.normal,
    //     letterSpacing: 0.1,
    //     color: darkColor,
    //   ),
    // ),
  );

  /// custom text-theme style
  static TextStyle customFontStyle({
    double fontSize = 16,
    Color color = primaryColor,
    FontWeight fontWeight = FontWeight.normal,
    double? lineHeight,
    double? letterSpacing,
    String? fontFamily = "WorkSans",
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          height: lineHeight,
          decoration: textDecoration,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily);
}
