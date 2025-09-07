import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/screens/notification/notification_view.dart';
import 'package:purpose_payment/themes/app_theme.dart';
import 'package:purpose_payment/widgets/custom_appbar.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class SpellingBeeWidget extends StatelessWidget {
  const SpellingBeeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar(
        "",
        actionWidget: GestureDetector(
          onTap: () {
            Get.to(() => NotificationScreen());
          },
          child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: AppThemes.black, width: 1),
              ),
              child: const Icon(
                Icons.notifications_active,
                color: AppThemes.black,
                size: 15,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card Container
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAE6CF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withValues(alpha: 0.2),
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: CustomText(
                    "Book",
                    fontSize: 3,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Next Button
            SignInButton(text: "Next", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
