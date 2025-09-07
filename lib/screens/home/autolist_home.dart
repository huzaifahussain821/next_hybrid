// import 'package:purpose_payment/screens/autolist_view/autolist_view.dart';
// import 'package:purpose_payment/screens/autosheet/autosheet_view.dart';
// import 'package:purpose_payment/screens/examples/examples_view.dart';
// import 'package:purpose_payment/screens/home/home_view.dart';
// import 'package:purpose_payment/screens/notification/notification_view.dart';
// import 'package:purpose_payment/screens/saved_files/saved_files_view.dart';
// import 'package:purpose_payment/screens/tutorial/tutorial_view.dart';
// import 'package:purpose_payment/utilities/app_exports.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:purpose_payment/screens/autolist_view/autolist_view.dart';
import 'package:purpose_payment/screens/autosheet/autosheet_view.dart';
import 'package:purpose_payment/screens/examples/examples_view.dart';
import 'package:purpose_payment/screens/notification/notification_view.dart';
import 'package:purpose_payment/screens/saved_files/saved_files_view.dart';
import 'package:purpose_payment/screens/tutorial/tutorial_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';

class AutoListHome extends StatelessWidget {
  const AutoListHome({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildStackArea() {
      return LayoutBuilder(
        builder: (context, constraints) {
          // Use the smaller side so the Stack never overflows vertically or horizontally
          final side = math.min(constraints.maxWidth, constraints.maxHeight);

          const cornerFactor = 0.45; // 43% of the stack width
          const centerFactor = 0.51; // 49% of the stack width

          return Center(
            child: SizedBox(
              width: side,
              height: side,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: FractionallySizedBox(
                      widthFactor: cornerFactor,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const ExamplesView()),
                        child: Image.asset(AssetsPath.topLeft,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FractionallySizedBox(
                      widthFactor: cornerFactor,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const AutosheetView()),
                        child: Image.asset(AssetsPath.topRight,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FractionallySizedBox(
                      widthFactor: cornerFactor,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const TutorialView()),
                        child: Image.asset(AssetsPath.bottomLeft,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FractionallySizedBox(
                      widthFactor: cornerFactor,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const SavedFilesView()),
                        child: Image.asset(AssetsPath.bottomRight,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: centerFactor,
                    child: GestureDetector(
                      onTap: () => Get.to(() => const AutolistView()),
                      child:
                          Image.asset(AssetsPath.centre, fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    final appBar = AppBarWidget.WithoutBackAppBar(
      "Home",
      actionWidget: GestureDetector(
        onTap: () => Get.to(() => NotificationScreen()),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppThemes.black, width: 1),
          ),
          child: const Icon(Icons.notifications_active,
              color: AppThemes.black, size: 15),
        ),
      ),
    );

    final banner = Container(
      decoration: BoxDecoration(
        // color: const Color(0xFFFAE6CF),
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 4,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AspectRatio(
          aspectRatio: 16 / 10, // keeps banner height reasonable on all screens
          child: Image.asset(
            AssetsPath.imageBg,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );

    final page = Column(
      children: [
        appBar,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: banner,
        ),
        const SizedBox(height: 20),
        // Stack area takes the remaining space and scales safely
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: buildStackArea(),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // On extremely short layouts (e.g., landscape small phones), allow scroll to prevent overflow
            if (constraints.maxHeight < 640) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: page,
                ),
              );
            }
            return page;
          },
        ),
      ),
    );
  }
}

// class AutoListHome extends StatelessWidget {
//   const AutoListHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppThemes.primaryColor,
//       body: Column(
//         children: [
//           AppBarWidget.WithoutBackAppBar(
//             "Home",
//             actionWidget: GestureDetector(
//               onTap: () {
//                 Get.to(() => NotificationScreen());
//               },
//               child: Container(
//                   padding: EdgeInsets.all(6),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.rectangle,
//                     border: Border.all(color: AppThemes.black, width: 1),
//                   ),
//                   child: const Icon(
//                     Icons.notifications_active,
//                     color: AppThemes.black,
//                     size: 15,
//                   )),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: const Color(0xFFFAE6CF),
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 4,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8), // match container radius
//               child: Image.asset(
//                 AssetsPath.imageBg,
//                 width: Get.width * 0.9,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           20.verticalSpace,
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 18),
//             child: Center(
//               child: Container(
//                 height: Get.height * 0.43,
//                 width: double.infinity,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     /// Top Left - Examples
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => const ExamplesView());
//                         },
//                         child: Image.asset(
//                           AssetsPath.topLeft,
//                           width: Get.width * 0.43,
//                         ),
//                       ),
//                     ),

//                     /// Top Right - Auto Sheet
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => const AutosheetView());
//                         },
//                         child: Image.asset(
//                           AssetsPath.topRight,
//                           width: Get.width * 0.43,
//                         ),
//                       ),
//                     ),

//                     /// Bottom Left - Tutorials
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => const TutorialView());
//                         },
//                         child: Image.asset(
//                           AssetsPath.bottomLeft,
//                           width: Get.width * 0.43,
//                         ),
//                       ),
//                     ),

//                     /// Bottom Right - Saved Files
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => const SavedFilesView());
//                         },
//                         child: Image.asset(
//                           AssetsPath.bottomRight,
//                           width: Get.width * 0.43,
//                         ),
//                       ),
//                     ),

//                     /// Center - Auto List Oval
//                     Positioned(
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => const AutolistView());
//                           // Get.to(() => const HomeView());
//                         },
//                         child: Image.asset(
//                           AssetsPath.centre,
//                           width: Get.width * 0.49,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
