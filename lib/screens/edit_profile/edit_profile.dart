import 'package:flutter/cupertino.dart';
import 'package:purpose_payment/screens/profile_view/profile_controller.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final controller = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    controller.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    // Call API on screen load
    // controller.fetchProfile();

    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.WithoutBackAppBar("Profile"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CupertinoActivityIndicator(
            color: AppThemes.black,
          ));
        }

        if (controller.profile.value == null) {
          return const Center(child: Text("No profile data found"));
        }

        final profile = controller.profile.value!;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // AppBarWidget.WithoutBackAppBar("Profile"),

                // Profile image
                GestureDetector(
                  onTap: () {}, // add image picker if needed
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: (profile.response?.data?.profileImage !=
                                null &&
                            profile.response!.data!.profileImage!.isNotEmpty)
                        ? NetworkImage(profile.response!.data!.profileImage!)
                        : const AssetImage(AssetsPath.emptyProfilePic)
                            as ImageProvider,
                    child: Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Name
                CustomTextWidget(
                  text: profile.response?.data?.firstName ?? "N/A",
                  textSize: 1.4,
                ),
                const SizedBox(height: 8),

                // Rating (if you have rating in API)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 20, color: Colors.orange),
                    CustomTextWidget(
                      text: "4.8",
                      textSize: 1.2,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Email
                CustomTextWidget(
                  text: profile.response?.data?.email ?? "N/A",
                  textSize: 1.1,
                ),
                const SizedBox(height: 8),

                // Address
                CustomTextWidget(
                  text: "No address provided",
                  textSize: 0.9,
                ),
                const SizedBox(height: 20),

                // Bio / description
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAE6CF),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "About",
                        fontWeight: FontWeight.w500,
                        fontSize: 1.2,
                      ),
                      CustomText(
                        maxLine: 20,
                        profile.response?.data?.bio ?? "No bio available",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// class MyProfController extends GetxController {
//   var isLoading = false.obs;
//   var profile = Rxn<GetProfileModel>();

//   // Fetch profile function
//   Future<void> fetchProfile() async {
//     try {
//       isLoading.value = true;

//       final result = await ProfileServices.getProfileApi();
//       if (result != null) {
//         profile.value = result;
//       } else {
//         Get.snackbar("Error", "Failed to fetch profile data");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Something went wrong: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
