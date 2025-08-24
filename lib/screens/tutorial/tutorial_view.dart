import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purpose_payment/utilities/app_assets_path.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_appbar.dart';
import 'package:purpose_payment/widgets/primary_button.dart';

class TutorialView extends StatelessWidget {
  const TutorialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppBarWidget.backAppBar("Tutorial"),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFAE6CF),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8), // match container radius
                child: Image.asset(
                  AssetsPath.imageBg,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            10.verticalSpace,
            PrimaryButton(
                text: "What It Is And How It Works",
                onPressed: () {
                  // Get.to(() => const UserGuideScreen());
                }),
            10.verticalSpace,
            PrimaryButton(text: "Data Input & Import", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(
                text: "Auto Selection",
                onPressed: () {
                  // Get.to(() => const UserGuideScreen());
                }),
            10.verticalSpace,
            PrimaryButton(text: "Example Spelling Bee", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
