import 'package:purpose_payment/dialog/delete_dialogbox.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:purpose_payment/screens/spelling_bee/spelling_bee.dart';
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
            ExampleContainerWidget(text: "Pilots Checklist", onPressed: () {}),
            10.verticalSpace,
            ExampleContainerWidget(text: "Inventory List", onPressed: () {}),
            10.verticalSpace,
            ExampleContainerWidget(
                text: "Recipe",
                onPressed: () {
                  // Get.to(() => const UserGuideScreen());
                }),
            10.verticalSpace,
            ExampleContainerWidget(
                text: "Spelling Bee",
                onPressed: () {
                  Get.to(() => const SpellingBee());
                }),
            10.verticalSpace,
            ExampleContainerWidget(text: "Math Practice", onPressed: () {}),
            10.verticalSpace,
            ExampleContainerWidget(text: "Application", onPressed: () {}),
            10.verticalSpace,
            ExampleContainerWidget(text: "Trivia", onPressed: () {}),
            10.verticalSpace,
            ExampleContainerWidget(text: "Training", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class ExampleContainerWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? backgroundColor;

  const ExampleContainerWidget(
      {required this.text,
      required this.onPressed,
      Key? key,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? const Color(0xFFFAE6CF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Color(0xFFDC6D02)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text,
                style: TextStyle(
                    fontSize: 16, fontFamily: "Zekton", color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
