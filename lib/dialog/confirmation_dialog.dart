import 'package:purpose_payment/utilities/app_exports.dart';

class ConfirmationDialog extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onClickedYes;
  final VoidCallback onClickedNo;

  const ConfirmationDialog({super.key, required this.title, required this.description, required this.onClickedYes, required this.onClickedNo});

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialog();
}

class _ConfirmationDialog extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Container(
          decoration: const BoxDecoration(
            color: AppThemes.primaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(10),
          child: CustomTextWidget(
            text: widget.title,
            textAlign: TextAlign.center,

            textColor: AppThemes.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleTextStyle: TextStyle(fontSize: 17.sp),
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              10.verticalSpace,
              CustomTextWidget(
                text: widget.description,
                textAlign: TextAlign.center,
                textSize: AppThemes.subHeadingSize(),
                textColor: AppThemes.primaryColor,
                fontWeight: FontWeight.w600,
                maxLine: 3,
              ),
            ],
          ),
        ),
        alignment: Alignment.center,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(100, 30), backgroundColor: AppThemes.primaryColor),
                  onPressed: widget.onClickedNo,
                  child: const CustomTextWidget(
                    text: "No",
                    textColor: AppThemes.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(100, 30), backgroundColor: AppThemes.primaryColor),
                  onPressed: widget.onClickedYes,
                  child: const CustomTextWidget(
                    text: "Yes",
                    textColor: AppThemes.white,
                    fontWeight: FontWeight.w700,

                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
