import 'package:flutter/material.dart';

import 'app_globals.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.primaryMaterialColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    brightness: Brightness.light,
    fontFamily: AppFonts.primary,
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.scaffoldBackground,
      titleTextStyle: AppTextTheme.headlineMedium.copyWith(
        color: AppColors.textPrimary,
      ),
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.dark,
      onSurface: AppColors.dark,
    ),
    // Add other theme properties as needed
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: AppColors.primaryMaterialColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    brightness: Brightness.dark,
    fontFamily: AppFonts.primary,
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.scaffoldBackground,
      titleTextStyle: AppTextTheme.headlineMedium.copyWith(
        color: AppColors.textPrimary,
      ),
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightColor,
      onSurface: AppColors.lightColor,
    ),
    // Add other theme properties as needed
  );
}

class AppColors {
  static bool get isDarkMode => AppGlobals.isDarkMode.value;

  // Primary Color
  static Color get primary =>
      isDarkMode ? Colors.transparent : Color(0xffD9CCE5);

  // Secondary Color
  static Color get secondary =>
      isDarkMode ? Color(0xFF03DAC6) : Color(0xFF03DAC6);

  // Text Colors
  static Color get textPrimary =>
      isDarkMode ? Color(0xFFFFFFFF) : Color(0xFF000000);

  static Color get textSecondary =>
      isDarkMode ? Color(0xFF000000) : Color(0xFF583A73);

  static Color get textTertiary =>
      isDarkMode ? Color(0xFF000000) : Color(0xff406F6C);

  static Color get labelColor =>
      isDarkMode ? Color(0xff9A9A9A) : Color(0xff323131);

  // Button Color
  static Color get buttonPrimary =>
      isDarkMode ? Color(0xFFD9CCE5) : Color(0xFFD9CCE5);

  static Color get buttonSecondary =>
      isDarkMode ? Color(0xFFD9CCE5) : Color(0xFF648987);

  static Color get buttonTertiary =>
      isDarkMode ? Color(0xFF000000) : Color(0xFFFFFFFF);

  static Color get buttonSecondaryBorder =>
      isDarkMode ? Color(0xFFFFFFFF) : Color(0xFFD9CCE5);

  // Background Colors
  static Color get scaffoldBackground =>
      isDarkMode ? Color(0xFF000000) : Color(0xFFFFFFFF);

  static Color get loginBackground =>
      isDarkMode ? Color(0xFF000000) : Color(0xFFD0E4E3);

  static Color get dialogImageBackground =>
      isDarkMode ? Color(0xFF262626) : Color(0xFFF0F0F0);

  static Color get homeScreenCardBgColor => isDarkMode ? grey700 : lightColor;

  //AppBar Color
  static Color get appBarBgColor => isDarkMode ? Color(0xff262626) : lightColor;

  // Surface Colors
  static Color get surface =>
      isDarkMode ? Color(0xFFFFFFFF) : Color(0xFF1E1E1E);

  // Indicator Colors
  static Color get indicatorColor =>
      isDarkMode ? Color(0xFF262626) : Color(0xFFEFEFEF);

  static Color get textFieldFillColor =>
      isDarkMode ? Color(0xFF000000) : Color(0xFFFFF5F8);

  static Color get textFieldBorderColor =>
      isDarkMode ? Color(0xFF583A73) : Color(0xFFC7FAF7);

  // Border Colors
  static Color get borderColor =>
      isDarkMode ? Color(0xFF589981) : Color(0xffF0F0F0);

  // Disabled Colors
  static const Color disabledLight = Color(0xFFBDBDBD);
  static const Color disabledDark = Color(0xFF616161);

  // Drawer Colors
  static Color get drawerBgColor => isDarkMode ? Color(0xFF101010) : primary;

  // Dialog Colors
  static Color get dialogBgColor => isDarkMode ? grey700 : lightColor;

  // Divider Color
  static Color get dividerColor =>
      isDarkMode ? Color(0xFF303030) : Color(0xFFEEEEEE);

  //Journal Colors
  static Color get journalBackgroundColor =>
      isDarkMode ? Color(0xFF101010) : Color(0xFFFAFAFA);

  static Color get avatarCreationTop =>
      isDarkMode ? lightColor : Colors.black.withValues(alpha: 0.1);

  static Color get avatarSelectionTop =>
      isDarkMode ? Color(0xFF000000) : redColor;

  static Color get avatarSelectionBgColor =>
      isDarkMode ? Color(0xFF000000) : peachColor;

  static const Color lightColor = Color(0xFFFFFFFF);
  static const Color lightTextSecondary = Color(0xFFAE93C8);

  static const Color purplePrimary = Color(0xFF583A73);

  static const Color greenColor = Color(0xFF119600);
  static const Color lightGreenColor = Color(0xFFDAEFDC);

  static const Color pinkColor = Color(0xFFFF4AA1);
  static const Color purpleColor = Color(0xFF8459AB);

  static const Color darkGreenColor = Color(0xFF6B6B6B);
  static const Color white100 = Color(0xFFFAFAFA);
  static const Color dark = Color(0xFF101010);
  static const Color grey = Color(0xFF808080);
  static const Color lightPrimary = Color(0xFFD9CCE5);

  static const Color grey100 = Color(0xFFF0F0F0);
  static const Color grey500 = Color(0xFF86878F);
  static const Color grey700 = Color(0xFF171717);
  static const Color favoriteColor = Color(0xFFFFC300);
  static const Color strokeColor = Color(0xFFD3D3D3);
  static const Color strokeDarkGreyColor = Color(0xFF2A2A2A);
  static const Color greenStrokeColor = Color(0xFF40876D);
  static const Color greyTextColor = Color(0xFFA1A2A5);
  static const Color greyColor = Color(0xFF70787D);
  static const Color orangeColor = Color(0xFFFF9500);
  static const Color peachColor = Color(0xFFFFDCD0);
  static const Color redColor = Color(0xFFFF5117);

  // Material Color from primary color
  static MaterialColor get primaryMaterialColor {
    return MaterialColor(primary.toARGB32(), {
      50: primary.withValues(alpha: 0.1),
      100: primary.withValues(alpha: 0.2),
      200: primary.withValues(alpha: 0.3),
      300: primary.withValues(alpha: 0.4),
      400: primary.withValues(alpha: 0.5),
      500: primary.withValues(alpha: 0.6),
      600: primary.withValues(alpha: 0.7),
      700: primary.withValues(alpha: 0.8),
      800: primary.withValues(alpha: 0.9),
      900: primary.withValues(alpha: 1.0),
    });
  }
}

class AppFonts {
  static const String primary = 'Parkinsans';
  // Add other font families as needed
}

class AppTextTheme {
  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Text Styles
  static TextStyle get displayLarge => TextStyle(
    fontSize: 57.0,
    fontWeight: light,
    letterSpacing: -0.25,
    color: AppColors.textPrimary,
  );

  static TextStyle get displayMedium => TextStyle(
    fontSize: 45.0,
    fontWeight: light,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle get displaySmall => TextStyle(
    fontSize: 36.0,
    fontWeight: regular,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle get headlineLarge => TextStyle(
    fontSize: 32.0,
    fontWeight: regular,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle get headlineMedium => TextStyle(
    fontSize: 28.0,
    fontWeight: regular,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
  );

  static TextStyle get headlineSmall => TextStyle(
    fontSize: 24.0,
    fontWeight: medium,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle get titleLarge => TextStyle(
    fontSize: 22.0,
    fontWeight: medium,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle get titleMedium => TextStyle(
    fontSize: 16.0,
    fontWeight: medium,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
  );

  static TextStyle get titleSmall => TextStyle(
    fontSize: 14.0,
    fontWeight: medium,
    letterSpacing: 0.1,
    color: Colors.white,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontSize: 16.0,
    fontWeight: regular,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontSize: 14.0,
    fontWeight: regular,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodySmall => TextStyle(
    fontSize: 12.0,
    fontWeight: regular,
    letterSpacing: 0.4,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelLarge => TextStyle(
    fontSize: 14.0,
    fontWeight: medium,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelMedium => TextStyle(
    fontSize: 12.0,
    fontWeight: medium,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelSmall => TextStyle(
    fontSize: 11.0,
    fontWeight: medium,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  // Text Theme
  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}
