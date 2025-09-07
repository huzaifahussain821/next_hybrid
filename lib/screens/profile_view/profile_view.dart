import 'package:flutter/cupertino.dart';
import 'package:purpose_payment/screens/profile_view/profile_controller.dart';
import 'package:purpose_payment/utilities/app_exports.dart';

class ProfileScreen extends StatefulWidget {
  final String? view;
  const ProfileScreen({super.key, this.view});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    if (widget.view == "edit") {
      controller.fetchProfile(setControllers: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar(
        widget.view == "create" ? "Create Profile" : "Edit Profile",
      ),
      body: Obx(() => Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Profile image
                      GestureDetector(
                        onTap: controller.pickImage,
                        child: Obx(() {
                          return CircleAvatar(
                            radius: 60,
                            backgroundImage: controller.profileImage.value !=
                                    null
                                ? FileImage(controller.profileImage.value!)
                                : const AssetImage(AssetsPath.emptyProfilePic)
                                    as ImageProvider,
                            child: Icon(Icons.camera_alt,
                                size: 30, color: Colors.black.withOpacity(0.7)),
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                      const CustomTextWidget(
                        text: "Upload Profile Picture",
                        textSize: 1.2,
                      ),
                      const SizedBox(height: 20),

                      // Text fields
                      _buildTextField(
                          controller.firstNameController, "First Name"),
                      const SizedBox(height: 10),
                      _buildTextField(
                          controller.lastNameController, "Last Name"),
                      const SizedBox(height: 10),
                      _buildTextField(controller.phoneController, "Phone",
                          keyboardType: TextInputType.phone),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller.emailController,
                        "Email",
                        keyboardType: TextInputType.emailAddress,
                        readOnly:
                            widget.view == "edit", // 👈 disable when editing
                      ),

                      const SizedBox(height: 10),
                      _buildTextField(controller.bioController, "Bio",
                          maxLines: 3),
                      const SizedBox(height: 20),

                      // Submit button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppThemes.backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(
                                  color: Colors.orange, width: 1),
                            ),
                          ),
                          onPressed: () async {
                            await controller.completeProfile();
                          },
                          child: CustomTextWidget(
                            text: widget.view == "create" ? "Create" : "Update",
                            textSize: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Loader overlay
              if (controller.isLoading.value)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          )),
    );
  }

  // Reusable text field widget
// Reusable text field method in ProfileScreen
  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool readOnly = false,
  }) {
    return CustomTextField(
      controller: controller,
      hintText: hint,
      keyboardType: keyboardType,
      readOnly: readOnly,
    );
  }
}
