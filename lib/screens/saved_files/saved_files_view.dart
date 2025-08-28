import 'package:flutter/cupertino.dart';
import 'package:purpose_payment/screens/login_view/widgets/signin_button.dart';
import 'package:purpose_payment/screens/saved_files/saved_files_controller.dart';
import 'package:purpose_payment/screens/saved_files/saved_files_details_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class SavedFilesView extends StatelessWidget {
  const SavedFilesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedFilesController());

    return Scaffold(
      appBar: AppBarWidget.backAppBar("Saved Files"),
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CupertinoActivityIndicator(
              color: Colors.black,
            ));
          }

          if (controller.savedFiles.isEmpty) {
            return const Center(child: CustomText("No saved files found"));
          }

          return ListView.separated(
            itemCount: controller.savedFiles.length,
            separatorBuilder: (_, __) => 10.verticalSpace,
            itemBuilder: (context, index) {
              final file = controller.savedFiles[index];
              return SavedFileContainerWidget(
                  backgroundColor: const Color(0xFFFAE6CF),
                  text: file.title ?? "Untitled",
                  onPressed: () {
                    Get.to(
                        () => SavedFilesDetailsView(
                              id: file.id.toString(),
                            ),
                        arguments: file);
                  },
                  onIconPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xFFFAE6CF),
                          title: const CustomText("Confirm Delete"),
                          content: const CustomText(
                            "Are you sure you want to delete this file?",
                            maxLine: 3,
                          ),
                          actions: [
                            SignInButton(
                              text: "No",
                              onPressed: () => Navigator.pop(context),
                            ),
                            6.verticalSpace,
                            SignInButton(
                              text: "Yes",
                              onPressed: () {
                                controller.deleteFile(file.id.toString());
                                Future.delayed(const Duration(seconds: 1), () {
                                  Navigator.pop(
                                      context); // Close dialog after 1 sec
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
                  });
            },
          );
        }),
      ),
    );
  }
}

class SavedFileContainerWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Function onIconPressed;
  final Color? backgroundColor;

  const SavedFileContainerWidget(
      {required this.text,
      required this.onPressed,
      super.key,
      this.backgroundColor,
      required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? const Color(0xFFF4F0E9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        side: const BorderSide(color: AppThemes.darkGreyColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: const TextStyle(
                    fontSize: 16, fontFamily: "Zekton", color: Colors.black)),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => onIconPressed(),
              icon: const Icon(
                CupertinoIcons.delete,
                color: Colors.red,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
