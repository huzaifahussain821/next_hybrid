import 'package:purpose_payment/screens/examples/examples_view.dart';
import 'package:purpose_payment/screens/home/home_view.dart';
import 'package:purpose_payment/screens/notification/notification_view.dart';
import 'package:purpose_payment/screens/saved_files/saved_files_view.dart';
import 'package:purpose_payment/screens/tutorial/tutorial_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';

class AutoListHome extends StatelessWidget {
  const AutoListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      body: Column(
        children: [
          AppBarWidget.WithoutBackAppBar(
            "Home",
            actionWidget: GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: AppThemes.black, width: 1),
                  ),
                  child: const Icon(
                    Icons.notifications_active,
                    color: AppThemes.black,
                    size: 15,
                  )),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFAE6CF),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // match container radius
              child: Image.asset(
                AssetsPath.imageBg,
                width: Get.width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: Container(
                height: Get.height * 0.43,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Top Left - Examples
                    Positioned(
                      top: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const ExamplesView());
                        },
                        child: Image.asset(
                          AssetsPath.topLeft,
                          width: Get.width * 0.43,
                        ),
                      ),
                    ),

                    /// Top Right - Auto Sheet
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const HomeView());
                        },
                        child: Image.asset(
                          AssetsPath.topRight,
                          width: Get.width * 0.43,
                        ),
                      ),
                    ),

                    /// Bottom Left - Tutorials
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const TutorialView());
                        },
                        child: Image.asset(
                          AssetsPath.bottomLeft,
                          width: Get.width * 0.43,
                        ),
                      ),
                    ),

                    /// Bottom Right - Saved Files
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const SavedFilesView());
                        },
                        child: Image.asset(
                          AssetsPath.bottomRight,
                          width: Get.width * 0.43,
                        ),
                      ),
                    ),

                    /// Center - Auto List Oval
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const HomeView());
                        },
                        child: Image.asset(
                          AssetsPath.centre,
                          width: Get.width * 0.49,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
