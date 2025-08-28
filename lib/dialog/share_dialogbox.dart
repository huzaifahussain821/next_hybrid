import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class ShareDialog extends StatelessWidget {
  const ShareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFAE6CF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            const CustomText(
              'Share "Lorem ipsum dolor sit amet, consectetur adipiscing elit"',
              fontSize: 1,
              maxLine: 5,
              fontWeight: FontWeight.w600,
              color: Colors.brown,
            ),
            const SizedBox(height: 12),

            /// Add People
            const CustomText(
              "Add People",
              fontSize: 1,
              fontWeight: FontWeight.w500,
              color: Colors.brown,
            ),
            const SizedBox(height: 16),

            /// People List
            ...List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAE6CF), // light cream card
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.brown.shade300, width: 1),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        /// Avatar
                        const CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                            "https://i.pravatar.cc/100?img=3",
                          ),
                        ),
                        const SizedBox(width: 10),

                        /// Name & Email
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                "Ivan Smith",
                                fontSize: 1,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown,
                              ),
                              CustomText(
                                "ivansmith@gmail.com",
                                fontSize: 1,
                                color: Colors.brown,
                              ),
                            ],
                          ),
                        ),

                        /// Role Selector Button
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 18, vertical: 6),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.orange, width: 1.5),
                        //     borderRadius: BorderRadius.circular(4),
                        //   ),
                        //   child: const CustomText(
                        //     "Editor",
                        //     fontSize: 1,
                        //     fontWeight: FontWeight.w500,
                        //     color: Colors.brown,
                        //   ),
                        // ),
                      ],
                    ),
                    10.verticalSpace,
                    SignInButton(
                      text: "Editor",
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              );
            }),

            /// Done Button (using your SigninButton widget)
            SignInButton(
              text: "Done",
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
