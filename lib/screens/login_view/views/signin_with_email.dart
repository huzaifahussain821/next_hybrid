import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/screens/login_view/signin_controller.dart';
import 'package:purpose_payment/screens/otp_view/otp_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text_field.dart';

class SigninWithEmail extends StatelessWidget {
  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar('Sign In with Email'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo (use your logo asset here)
            Image.asset(AssetsPath.logo, height: 120),
            SizedBox(height: 20),
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please Sign-in to your account',
              style: TextStyle(fontSize: 14, color: Colors.brown),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: signInController.emailController,
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    signInController.loginUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF4F0E9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Color(0xFFDC6D02)),
                  ),
                  child: Obx(() => signInController.isLoading.value
                      ? CupertinoActivityIndicator(color: Colors.black)
                      : Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Zekton",
                            color: Colors.black,
                          ),
                        )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
