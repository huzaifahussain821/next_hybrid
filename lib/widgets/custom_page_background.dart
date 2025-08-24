import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/app_theme.dart';
import '../utilities/app_assets_path.dart';

class CustomPageBackground extends StatelessWidget {
  final Widget child;
  final bool? showTop;

  const CustomPageBackground({
    super.key,
    required this.child,
    this.showTop=false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height,
      decoration: const BoxDecoration(color: AppThemes.white),
      child: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child: Image.asset(
            //     AssetsPath.topRightShade,
            //     height: 350,
            //   ),
            // ),
            Align(
              alignment:showTop==false?Alignment.bottomCenter : Alignment.topCenter,
              child: Image.asset(
                AssetsPath.bottomShade,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
