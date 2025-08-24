// import 'package:flutter/material.dart';
// import 'package:purpose_payment/screens/login_view/views/signin_view.dart';
// import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
// import 'package:purpose_payment/screens/settings/settings_controller.dart';
// import 'package:purpose_payment/utilities/app_exports.dart';
// import 'package:purpose_payment/widgets/custom_text.dart';

// class LogoutDialogbox extends StatelessWidget {
//   const LogoutDialogbox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         decoration: BoxDecoration(
//           border:
//               Border.all(color: const Color.fromARGB(255, 84, 27, 6), width: 2),
//           color: const Color(0xFFFAE6CF),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                       color: Color.fromARGB(255, 84, 27, 6), width: 1.5),
//                 ),
//               ),
//               child: const Center(
//                 child: CustomText(
//                   "Logout",
//                   fontSize: 1.5,
//                   color: Colors.brown,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Tick Icon
//             const CircleAvatar(
//               radius: 32,
//               backgroundColor: Colors.brown,
//               child: Icon(Icons.check, color: Colors.white, size: 40),
//             ),

//             const SizedBox(height: 16),

//             // Confirmation Text
//             const CustomText(
//               "Are you sure?",
//               fontSize: 1.1,
//               color: Colors.brown,
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 20),

//             // Buttons
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: SignInButton(
//                 text: "Yes",
//                 onPressed: () {
//                   Get.back();
//                   SettingsController.to.logoutUser();
//                 },
//               ),
//             ),

//             const SizedBox(height: 10),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: SignInButton(
//                   text: "No",
//                   onPressed: () {
//                     Get.back();
//                   }),
//             ),
//             10.verticalSpace
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/screens/settings/settings_controller.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';

class LogoutDialogbox extends StatelessWidget {
  const LogoutDialogbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromARGB(255, 84, 27, 6), width: 2),
          color: const Color(0xFFFAE6CF),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 84, 27, 6), width: 1.5),
                ),
              ),
              child: const Center(
                child: CustomText(
                  "Logout",
                  fontSize: 1.5,
                  color: Colors.brown,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Tick Icon
            const CircleAvatar(
              radius: 32,
              backgroundColor: Colors.brown,
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 16),

            // Confirmation Text
            const CustomText(
              "Are you sure?",
              fontSize: 1.1,
              color: Colors.brown,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // ✅ Yes button (calls logout)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                final isLoading = SettingsController.to.isLoading.value;
                return SignInButton(
                  text: isLoading ? "Logging out..." : "Yes",
                  onPressed: () {
                    if (!isLoading) {
                      SettingsController.to.logoutUser();
                      Get.back(); // close dialog only after calling logout
                    }
                  },
                );
              }),
            ),

            const SizedBox(height: 10),

            // ❌ Cancel button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SignInButton(
                text: "No",
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
