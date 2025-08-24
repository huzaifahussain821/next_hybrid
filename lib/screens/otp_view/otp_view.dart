import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/themes/app_theme.dart';
import 'package:purpose_payment/utilities/app_assets_path.dart';
import 'package:purpose_payment/widgets/custom_appbar.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/themes/app_theme.dart';
import 'package:purpose_payment/utilities/app_assets_path.dart';
import 'package:purpose_payment/widgets/custom_appbar.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'otp_controller.dart';

class OtpView extends StatelessWidget {
  final int? userId;
  OtpView({super.key, this.userId});

  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar('OTP Verification'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // 👈 important to shrink wrap
              children: [
                Image.asset(AssetsPath.logo, height: 120),
                const SizedBox(height: 20),

                CustomText(
                  "Please Verify Your Account",
                  fontSize: 1.5,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                const CustomText(
                  maxLine: 3,
                  "We sent you a six-digit verification code to verify your account",
                  style: TextStyle(
                    fontFamily: "zekton",
                    fontSize: 14,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                /// OTP Boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        controller: controller.textControllers[index],
                        onChanged: (value) {
                          if (value.length == 1 && index < 5) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                          controller.setOtpDigit(index, value);
                        },
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.brown),
                        decoration: InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFB87333), width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFB87333), width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 40),

                // Circular Timer
                Obx(() {
                  return SizedBox(
                    height: 120,
                    width: 120,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Solid brown circle
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 79, 26, 7),
                            shape: BoxShape.circle,
                          ),
                        ),

                        // Progress border
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: CircularProgressIndicator(
                            value: controller.progress.value,
                            strokeWidth: 6,
                            backgroundColor: const Color(0xFFE0CBB8),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFB87333),
                            ),
                          ),
                        ),

                        // Timer text
                        CustomText(
                          "00:${controller.secondsLeft.value.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Zekton",
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 20),

                // Resend OTP Button (only visible when timer is finished)
                Obx(() {
                  if (controller.canResend.value) {
                    return ElevatedButton(
                      onPressed: () => controller.resendOtp(userId!),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                const SizedBox(height: 20),

                /// Continue Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (userId != null) {
                          controller.sendOtp(userId!);
                        } else {
                          Get.snackbar("Error", "User ID is missing");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF4F0E9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFFDC6D02)),
                      ),
                      child: Obx(() => controller.isLoading.value
                          ? CupertinoActivityIndicator(color: Colors.black)
                          : const Text(
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

                const SizedBox(height: 40), // 👈 replaced Spacer()

                /// Resend Text
                CustomText(
                  maxLine: 3,
                  "Didn't receive the code? Resend",
                  style: const TextStyle(
                    fontFamily: "zekton",
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class OtpView extends StatelessWidget {
//   final int? userId;
//   OtpView({super.key, this.userId});

//   final OtpController controller = Get.put(OtpController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppThemes.primaryColor,
//       appBar: AppBarWidget.backAppBar('OTP Verification'),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             children: [
//               Image.asset(AssetsPath.logo, height: 120),
//               const SizedBox(height: 20),
//               CustomText(
//                 "Please Verify Your Account",
//                 fontSize: 1.5,
//                 fontWeight: FontWeight.bold,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 8),
//               const CustomText(
//                 maxLine: 3,
//                 "We sent you a six-digit verification code to verify your account",
//                 style: TextStyle(
//                   fontFamily: "zekton",
//                   fontSize: 14,
//                   color: Colors.brown,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 40),

//               /// OTP Boxes
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(6, (index) {
//                   return SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: TextField(
//                       controller: controller.textControllers[index],
//                       onChanged: (value) {
//                         if (value.length == 1 && index < 5) {
//                           FocusScope.of(context).nextFocus();
//                         } else if (value.isEmpty && index > 0) {
//                           FocusScope.of(context).previousFocus();
//                         }
//                         controller.setOtpDigit(index, value);
//                       },
//                       maxLength: 1,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(fontSize: 20, color: Colors.brown),
//                       decoration: InputDecoration(
//                         counterText: "",
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color(0xFFB87333), width: 2),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color(0xFFB87333), width: 2),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                     ),
//                   );
//                 }),
//               ),
//               const SizedBox(height: 40),
//               // Circular Timer
//               Obx(() {
//                 return SizedBox(
//                   height: 120,
//                   width: 120,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // Solid brown circle
//                       Container(
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 79, 26, 7),
//                           shape: BoxShape.circle,
//                         ),
//                       ),

//                       // Progress border
//                       SizedBox(
//                         height: 120,
//                         width: 120,
//                         child: CircularProgressIndicator(
//                           value: controller.progress.value,
//                           strokeWidth: 6,
//                           backgroundColor: const Color(0xFFE0CBB8),
//                           valueColor: const AlwaysStoppedAnimation<Color>(
//                             Color(0xFFB87333),
//                           ),
//                         ),
//                       ),

//                       // Timer text
//                       CustomText(
//                         "00:${controller.secondsLeft.value.toString().padLeft(2, '0')}",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontFamily: "Zekton",
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }),

//               const SizedBox(height: 20),

//               // Resend OTP Button (only visible when timer is finished)
//               Obx(() {
//                 if (controller.canResend.value) {
//                   return ElevatedButton(
//                     onPressed: () => controller.resendOtp(userId!),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.brown,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Resend OTP",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               }),
//               const SizedBox(height: 20),

//               /// Continue Button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (userId != null) {
//                         controller.sendOtp(userId!);
//                       } else {
//                         Get.snackbar("Error", "User ID is missing");
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFF4F0E9),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4)),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       side: const BorderSide(color: Color(0xFFDC6D02)),
//                     ),
//                     child: Obx(() => controller.isLoading.value
//                         ? const CircularProgressIndicator(color: Colors.black)
//                         : const Text(
//                             'Continue',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: "Zekton",
//                               color: Colors.black,
//                             ),
//                           )),
//                   ),
//                 ),
//               ),

//               const Spacer(),

//               /// Resend Text
//               CustomText(
//                 maxLine: 3,
//                 "Didn't receive the code? Resend",
//                 style: const TextStyle(
//                   fontFamily: "zekton",
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
