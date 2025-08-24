import 'package:purpose_payment/dialog/delete_dialogbox.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/primary_button.dart';

class ExamplesView extends StatelessWidget {
  const ExamplesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.backAppBar("Examples"),
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            PrimaryButton(text: "Pilots Checklist", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "Inventory List", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(
                text: "Recipe",
                onPressed: () {
                  // Get.to(() => const UserGuideScreen());
                }),
            10.verticalSpace,
            PrimaryButton(text: "Spelling Bee", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "Math Practice", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "Application", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "Trivia", onPressed: () {}),
            10.verticalSpace,
            PrimaryButton(text: "Training", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
