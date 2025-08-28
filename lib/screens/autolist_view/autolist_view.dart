import 'package:flutter/material.dart';
import 'package:purpose_payment/dialog/share_dialogbox.dart';
import 'package:purpose_payment/themes/app_theme.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/utilities/app_theme.dart';
import 'package:purpose_payment/widgets/custom_appbar.dart';
import 'package:purpose_payment/widgets/custom_text_field.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class AutolistView extends StatelessWidget {
  const AutolistView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.filled(7, "Lorem Ipsum"); // 7 hardcoded

    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar(
        "",
        actionWidget: Row(
          children: [
            _topContainer("Save", () {}),
            const SizedBox(width: 8),
            _topContainer("Share", () {
              showDialog(
                context: context,
                builder: (context) => const ShareDialog(),
              );
            }),
            const SizedBox(width: 8),
            _topContainer("Language", () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _iconContainer(Icons.add_circle_outline_outlined, () {}),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFFAE6CF), // light peach bg like screenshot
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    "Add Title",
                    fontSize: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 12),

                  // Hardcoded fields
                  ...items.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF4F0E9),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.orange.withOpacity(0.3),
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                height: 60,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(e, fontSize: 1.2)))),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _iconContainer(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFFFAE6CF)),
      child: Icon(icon, color: Colors.black, size: 24),
    ),
  );
}

Widget _topContainer(String text, Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(6),
      ),
      child: CustomText(text, fontSize: 0.8, color: Colors.black),
    ),
  );
}
