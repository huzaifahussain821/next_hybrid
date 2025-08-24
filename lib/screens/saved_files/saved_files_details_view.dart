import 'package:purpose_payment/screens/home/home_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

// climport 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';

class SavedFilesDetailsView extends StatelessWidget {
  final String id;

  const SavedFilesDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // Get the passed file data from arguments
    final file = Get.arguments;

    return Scaffold(
      appBar: AppBarWidget.backAppBar("Saved Files Details",
          actionWidget: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(() => const HomeView(view: "edit"), arguments: file);
                  },
                  child: Icon(Icons.edit, color: Colors.black)),
              SizedBox(width: 8),
            ],
          )),
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    file.title ?? "Untitled",
                    fontSize: 1.4,
                  ),
                  10.verticalSpace,
                  ...file.items.map<Widget>((item) => Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F0E9),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFDC6D02)),
                        ),
                        child: CustomText(
                          item,
                          maxLine: null,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
