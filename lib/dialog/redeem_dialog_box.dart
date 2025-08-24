import 'package:purpose_payment/widgets/custom_text.dart';

import '../utilities/app_exports.dart';

class RedeemDialogBox extends StatefulWidget {
  final String title;
  final String description;
  final double? height;
  final String? icon;
  final Color? iconColor;
  final VoidCallback? onClickedYes;
  final String? onClickedYesText;
  final Color? onClickedYesColor;
  final Color? onClickedYesTextColor;
  final VoidCallback? onClickedNo;
  final String? onClickedNoText;
  final Color? onClickedNoColor;
  final Color? onClickedNoTextColor;

  const RedeemDialogBox(
      {super.key,
      required this.title,
      required this.description,
      this.onClickedYes,
      this.onClickedNo,
      this.icon,
      this.iconColor,
      this.onClickedYesText,
      this.onClickedNoText,
      this.height,
      this.onClickedYesColor,
      this.onClickedNoColor,
      this.onClickedYesTextColor,
      this.onClickedNoTextColor});

  @override
  State<RedeemDialogBox> createState() => _RedeemDialogBox();
}

class _RedeemDialogBox extends State<RedeemDialogBox> {
  @override
  Widget build(BuildContext context) {
    debugPrint("title: ${widget.title}");
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
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        content: Stack(
          clipBehavior: Clip.none, // Allows overflow
          alignment: Alignment.topCenter,
          children: [
            Container(
              // height: widget.height ?? 140,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.title != ""
                      ? CustomText(
                          widget.title,
                          fontWeight: FontWeight.bold,
                          fontSize: 1.2,
                        )
                      : const SizedBox.shrink(),
                  widget.title != ""
                      ? const SizedBox(height: 4)
                      : const SizedBox.shrink(),
                  widget.description != ""
                      ? CustomText(
                          widget.description,
                          maxLine: 5,
                          textAlign: TextAlign.center,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            Positioned(
              top: -35, // Half of the icon overflow
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withValues(alpha: 0.2), // Shadow color
                      spreadRadius: 4, // How much the shadow spreads
                      blurRadius: 10, // Softness of the shadow
                      offset: const Offset(0, 5), // Shadow position
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Image.asset(
                    widget.icon ?? "",
                    // color: widget.iconColor ?? Colors.white,
                    scale: 2.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.onClickedNo != null
                  ? Expanded(
                    child: CustomElevatedButton(
                        height: 40,
                        fontSize: 13,
                        // width: 100,
                        borderRadius: 4,
                        borderColor: AppThemes.transparentColor,
                        onTap: widget.onClickedNo,
                        buttonColor:
                            widget.onClickedYesColor ?? AppThemes.primaryColor,
                        textColor:
                            widget.onClickedYesTextColor ?? AppThemes.white,
                        text: widget.onClickedNoText ?? "No",
                      ),
                  )
                  : const SizedBox.shrink(),
              (widget.onClickedNo != null && widget.onClickedYes != null)
                  ? const SizedBox(
                      width: 10,
                    )
                  : const SizedBox.shrink(),
              widget.onClickedYes != null
                  ? Expanded(
                    child: CustomElevatedButton(
                        height: 40,
                        fontSize: 13,
                        // width: 100,
                        borderRadius: 4,
                        borderColor: AppThemes.transparentColor,
                        onTap: widget.onClickedYes,
                        buttonColor:
                            widget.onClickedYesColor ?? AppThemes.primaryColor,
                        textColor:
                            widget.onClickedYesTextColor ?? AppThemes.white,
                        text: widget.onClickedYesText ?? "No",
                      ),
                  )
                  : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}

showRedeemDialogbox({
  required String title,
  required String description,
  VoidCallback? onClickedYes,
  VoidCallback? onClickedNo,
  String? icon,
  Color? iconColor,
  String? onClickedYesText,
  String? onClickedNoText,
  double? height,
}) {
  showDialog(
    barrierDismissible: false,
    context: AppGlobals.appNavigationKey.currentContext!,
    builder: (BuildContext context) {
      return RedeemDialogBox(
        title: title,
        description: description,
        onClickedYes: onClickedYes,
        onClickedNo: onClickedNo,
        icon: icon,
        iconColor: iconColor,
        onClickedYesText: onClickedYesText,
        onClickedNoText: onClickedNoText,
        height: height,
      );
    },
  );
}
