import 'package:country_code_picker/country_code_picker.dart';
import 'package:purpose_payment/screens/login_view/signin_controller.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/screens/otp_view/otp_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class SigninWithPhone extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar('Sign In with Phone'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.logo,
              height: 120,
            ),
            SizedBox(height: 20),
            CustomText(
              'Welcome Back!',
              fontSize: 1.5,
            ),
            SizedBox(height: 8),
            CustomText(
              'Please Sign-in to your account',
            ),
            SizedBox(height: 40),

            Row(
              children: [
                // Country Code Box
                GestureDetector(
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       content: SizedBox(
                    //         height: 300,
                    //         child: CountryCodePicker(
                    //           onChanged: (CountryCode country) {
                    //             controller
                    //                 .setCountryCode(country.dialCode ?? '');
                    //             Navigator.pop(
                    //                 context); // close dialog after selection
                    //           },
                    //           searchDecoration: const InputDecoration(
                    //             hintText: 'Select Country',
                    //             border: OutlineInputBorder(),
                    //           ),
                    //           initialSelection: 'US',
                    //           showFlag: true,
                    //           showFlagDialog: true,
                    //           alignLeft: true,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF7ED),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.brown, width: 1),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.image, size: 20, color: Colors.black),
                        const SizedBox(width: 4),
                        Obx(() => Text(
                              controller.selectedCode.value,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            )),
                        const SizedBox(width: 2),
                        const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black, size: 18),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 6),

                // Phone Number Input
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF7ED),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.brown, width: 1),
                    ),
                    child: TextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone, color: Colors.black),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CountryCodePicker(
            //         onChanged: (CountryCode country) {
            //           controller.setCountryCode(country.dialCode ?? '');
            //         },
            //         searchDecoration: InputDecoration(
            //           hintText: 'Select Country',
            //           border: OutlineInputBorder(),
            //         ),
            //         initialSelection: 'US',
            //         showFlag: true,
            //         showFlagDialog: true,
            //         alignLeft: true,
            //       ),
            //     ),
            //     Expanded(
            //       child: TextField(
            //         onChanged: controller.setPhoneNumber,
            //         keyboardType: TextInputType.phone,
            //         decoration: InputDecoration(
            //           hintText: 'Phone Number',
            //           border: OutlineInputBorder(),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 20),

            /// Continue button
            SignInButton(
                text: "Continue",
                onPressed: () {
                  Get.to(() => OtpView());
                })
          ],
        ),
      ),
    );
  }
}
