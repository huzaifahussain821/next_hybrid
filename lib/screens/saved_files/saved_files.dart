import 'package:purpose_payment/dialog/delete_dialogbox.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/primary_button.dart';

class SavedFilesView extends StatelessWidget {
  const SavedFilesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.backAppBar("Saved Files"),
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            PrimaryButton(text: "Campout Groceries", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "RV Checklist", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(
                text: "Cesna Checklist",
                onPressed: () {
                  // Get.to(() => const UserGuideScreen());
                }),
            10.verticalSpace,
            PrimaryButton(
                text: "Job Application",
                onPressed: () {
                  // Get.to(() => const ProfileScreen());
                }),
            10.verticalSpace,
            PrimaryButton(text: "Job Training", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "Brownie Recipe", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "Work Spreadsheet", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
