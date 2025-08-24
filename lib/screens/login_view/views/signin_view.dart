import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:purpose_payment/screens/dashboard/view/dashboard_view.dart';
import 'package:purpose_payment/screens/home/home_view.dart';
import 'package:purpose_payment/screens/login_view/signin_controller.dart';
import 'package:purpose_payment/screens/login_view/views/signin_with_email.dart';
import 'package:purpose_payment/screens/login_view/views/signin_with_phone.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/utilities/app_exports.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBar(
        backgroundColor: AppThemes.primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsPath.logo,
                scale: 2,
                height: 120,
              ),
              const SizedBox(height: 40),
              SignInButton(
                text: 'Sign In with Email',
                icon: Icons.email_outlined,
                onPressed: () {
                  Get.to(() => SigninWithEmail());
                },
                // onPressed: controller.signInWithEmail,
              ),
              const SizedBox(height: 16),
              SignInButton(
                text: 'Sign In with Phone',
                icon: Icons.phone_outlined,
                onPressed: () {
                  Get.to(() => SigninWithPhone());
                },
                // onPressed: controller.signInWithPhone,
              ),
              const SizedBox(height: 16),
              SignInButton(
                text: 'Sign In with Google',
                icon: FontAwesome.google,
                onPressed: () {
                  // Get.to(() => DashboardView());
                },
              ),
              const SizedBox(height: 16),
              SignInButton(
                text: 'Sign In with Apple',
                icon: FontAwesome.apple,
                onPressed: controller.signInWithApple,
              ),
              Spacer(),
              const Text(
                'By sign-in, you agree to our\nTerms & Conditions & Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Zekton",
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
