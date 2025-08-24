import 'package:purpose_payment/dialog/delete_dialogbox.dart';
import 'package:purpose_payment/dialog/logout_dialogbox.dart';
import 'package:purpose_payment/screens/aboutus/aboutus.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:purpose_payment/screens/termandconditions/terms_and_condition.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/primary_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.WithoutBackAppBar("Settings"),
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            PrimaryButton(text: "Notifications", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(
                text: "About us",
                onPressed: () {
                  Get.to(() => const Aboutus());
                }),
            10.verticalSpace,
            PrimaryButton(
                text: "User Guide",
                onPressed: () {
                  // Get.to(() => const UserGuideScreen());
                }),
            10.verticalSpace,
            PrimaryButton(
                text: "User Profile",
                onPressed: () {
                  Get.to(() => const ProfileScreen(
                        view: "edit",
                      ));
                }),
            10.verticalSpace,
            PrimaryButton(text: "Privacy Policies", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(
                text: "Terms and Conditions",
                onPressed: () {
                  Get.to(() => const TermsAndCondition());
                }),
            10.verticalSpace,
            PrimaryButton(
                text: "Delete Account",
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const DeleteAccountDialog(),
                  );
                }),
            10.verticalSpace,
            PrimaryButton(
                text: "Logout",
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const LogoutDialogbox(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
