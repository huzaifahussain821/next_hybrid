import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  final Color backgroundColor;
  final Brightness statusBarIconBrightness;
  final Brightness statusBarBrightness;
  final Color statusBarColor;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;

  const CustomScaffoldWidget({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor = Colors.black,
    this.statusBarColor = Colors.black,
    this.statusBarIconBrightness = Brightness.light, // White icons
    this.statusBarBrightness = Brightness.dark, // For iOS
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // statusBarColor: Colors.black,
        // statusBarIconBrightness: Brightness.dark,
        // statusBarBrightness: Brightness.dark,
        // systemNavigationBarIconBrightness: Brightness.dark,
        // systemStatusBarContrastEnforced: true,
        // systemNavigationBarColor: AppThemes.errorColor,
        // systemNavigationBarContrastEnforced: true,
        // systemNavigationBarDividerColor: AppThemes.yellow,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar as PreferredSizeWidget?,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
