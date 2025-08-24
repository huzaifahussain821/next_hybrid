// import 'package:flutter/foundation.dart';
// import 'package:intl/intl.dart';
// import 'package:purpose_payment/utilities/app_preferences.dart';

// import 'app_exports.dart';

// class AppHelper {
//   // static changeTheme() {
//   //   if(kDebugMode){
//   //     AppGlobals.isDarkMode.toggle();
//   //     Get.changeThemeMode(
//   //       AppGlobals.isDarkMode.value ? ThemeMode.light : ThemeMode.dark,
//   //     );
//   //     AppPreferences.isDarkMode = AppGlobals.isDarkMode.value;
//   //     Get.forceAppUpdate();
//   //   }

//   // }
//   static Future<DateTime> pickDate(
//       BuildContext context, {
//         bool isFilterDialog = false,
//         DateTime? lastDate,
//       }) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: lastDate ?? DateTime(2101),
//       helpText: 'Select Date of Birth',
//       cancelText: 'Cancel',
//       confirmText: 'Select',
//       fieldLabelText: 'Date of Birth',
//       fieldHintText: 'Month/Day/Year',
//       errorFormatText: 'Enter valid date',
//       errorInvalidText: 'Enter date in valid range',
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData(
//             colorScheme: AppGlobals.isDarkMode.value
//                 ? ColorScheme.dark(
//               primary: AppColors.primary,
//             )
//                 : ColorScheme.light(
//               primary: AppColors.primary,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: AppColors.buttonPrimary,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null && picked != DateTime.now()) {
//       return picked;
//     }
//     return DateTime.now();
//   }
//   static String? formatDate(DateTime? date) {
//     if(date == null){
//       return null;
//     }
//     return DateFormat('dd MMM yyyy').format(date);
//   }

//   static String toISOFormatDate(String dateString) {
//     // Parse the input date string to a DateTime object
//     DateTime dateTime = DateFormat('dd MMM yyyy').parse(dateString);

//     // Format the DateTime object to the desired format (YYYY-MM-DD)
//     String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
//     return formattedDate;
//   }
// }
