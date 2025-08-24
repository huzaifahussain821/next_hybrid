import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/screens/login_view/views/signin_view.dart';
import 'package:purpose_payment/themes/app_globals.dart';
import 'package:purpose_payment/utilities/app_preferences.dart';

import 'themes/app_theme.dart';
import 'utilities/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializePreferences();
  // Get.put(DashboardController());
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..boxShadow = <BoxShadow>[]
    ..progressColor = Colors.white
    ..backgroundColor = AppThemes.primaryColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.black.withValues(alpha: 0.7)
    ..userInteractions = false
    ..dismissOnTap = false;
  // // Set the global status bar style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppThemes.primaryColor,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    // systemStatusBarContrastEnforced: true,
    // systemNavigationBarContrastEnforced: true,
  ));
  FlutterError.onError = (FlutterErrorDetails details) {
    // Log to console or send to an error reporting service like Firebase Crashlytics
    debugPrint("Flutter Error in Release: ${details.exceptionAsString()}");
    FlutterError.dumpErrorToConsole(details); // Optional
  };

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // enableScaleWH: ()=>false,
        // enableScaleText: ()=>false,
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: AppThemes.white,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            child: GetMaterialApp(
              title: AppStrings.appTitle,
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
              home: SignInScreen(),
              navigatorKey: AppGlobals.appNavigationKey,
            ),
          );
        });
  }
}
