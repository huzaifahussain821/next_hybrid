// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../themes/app_extensions.dart';
// import '../themes/app_theme.dart';
// import 'custom_text_widget.dart';

// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     this.controller,
//     this.helperValue = "",
//     this.validator,
//     this.readOnly = false,
//     this.isEnabled = true,
//     this.obscureText = false,
//     this.showBorders = true,
//     this.readOnlyTextColor,
//     this.prefixIcon,
//     this.prefixIconConstraints,
//     this.suffixIconConstraints,
//     this.suffixIcon,
//     this.suffixIconTap,
//     this.hintValue,
//     this.onChanged,
//     this.prefixIconColor,
//     this.type,
//     this.prefixText,
//     this.prefixStringText,
//     this.suffixText,
//     this.textCapitalization = TextCapitalization.none,
//     this.prefixWidget,
//     this.suffixWidget,
//     this.fillColor,
//     this.prefixType,
//     this.maxLength = 40,
//     this.maxLines = 1,
//     this.minLines,
//     this.onSubmit,
//     this.helperTextStyle,
//     this.upperLabelColor,
//     this.hintTextStyle,
//     this.textStyle,
//     this.focusNode,
//     this.upperLabel,
//     this.upperLabelStyle,
//     this.upperLabelReqStar,
//     this.onEditingComplete,
//     this.borderRadius,
//     this.inputFormatters,
//     this.textInputAction,
//     this.autofocus = false,
//     this.height,
//     this.onTap,
//     this.enableInteractiveSelection,
//     this.enableSuggestions = true,
//     this.autocorrect = false,
//     this.textDirection,
//     this.outerPadding = const EdgeInsets.symmetric(horizontal: 2.0),
//     this.showStaticBottomShadow = false,
//     this.staticBottomShadowColor,
//     this.borderColor,
//     this.labelColor,
//   });

//   final String? prefixType;
//   final String? hintValue;
//   final String? helperValue;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final bool obscureText;
//   final IconData? prefixIcon;
//   final BoxConstraints? prefixIconConstraints;
//   final BoxConstraints? suffixIconConstraints;
//   final Widget? prefixText;
//   final String? prefixStringText;
//   final Widget? suffixText;
//   final Widget? prefixWidget;
//   final Widget? suffixWidget;
//   final Color? fillColor, upperLabelColor;
//   final Color? prefixIconColor;
//   final IconData? suffixIcon;
//   final VoidCallback? suffixIconTap;
//   final TextInputType? type;
//   final int? minLines;
//   final int? maxLines;
//   final String? upperLabel;
//   final TextStyle? upperLabelStyle;
//   final String? upperLabelReqStar;
//   final void Function(String)? onChanged;
//   final void Function()? onEditingComplete;
//   final int maxLength;
//   final dynamic onSubmit;
//   final TextStyle? helperTextStyle;
//   final TextStyle? hintTextStyle;
//   final TextStyle? textStyle;
//   final FocusNode? focusNode;
//   final bool readOnly;
//   final bool isEnabled;
//   final bool showBorders;
//   final Color? readOnlyTextColor, borderColor, labelColor;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextCapitalization textCapitalization;
//   final BorderRadius? borderRadius;
//   final bool autofocus;
//   final TextInputAction? textInputAction;
//   final void Function()? onTap;
//   final double? height;
//   final bool? enableInteractiveSelection;
//   final bool enableSuggestions;
//   final bool autocorrect;
//   final TextDirection? textDirection;
//   final EdgeInsetsGeometry outerPadding;
//   final bool showStaticBottomShadow;
//   final Color? staticBottomShadowColor;

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   late FocusNode _focusNode;
//   late bool obscureText;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     obscureText = widget.obscureText;
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (!(widget.readOnly && !widget.isEnabled) && widget.onTap != null) {
//           widget.onTap!();
//         }
//       },
//       child: AbsorbPointer(
//         absorbing: widget.readOnly,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             widget.upperLabel.isNotNullAndNotEmpty
//                 ? Padding(
//                     padding: widget.outerPadding,
//                     child: Row(
//                       children: [
//                         CustomTextWidget(
//                           text: widget.upperLabel!,
//                           fontWeight: FontWeight.w500,
//                           textColor: widget.upperLabelColor,
//                           textStyle: const TextStyle(color: Colors.black87),
//                         ),
//                         if (widget.upperLabelReqStar.isNotNullAndNotEmpty)
//                           Text(
//                             " ${widget.upperLabelReqStar!}",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleMedium!
//                                 .copyWith(
//                                     color: widget.readOnly
//                                         // ? AppThemes.darkGreyColor
//                                         ? AppThemes.errorColor
//                                         : AppThemes.errorColor,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 16),
//                           ),
//                       ],
//                     ),
//                   )
//                 : const SizedBox(),
//             Focus(
//               autofocus: true,
//               onFocusChange: (focus) {
//                 setState(() {});
//               },
//               child: PhysicalModel(
//                 color: Colors.transparent,
//                 elevation: widget.showStaticBottomShadow ? 6 : 0,
//                 shadowColor: widget.showStaticBottomShadow
//                     ? widget.staticBottomShadowColor ??
//                         AppThemes.grey100Color.withValues(alpha: 0.1)
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(08),
//                 child: TextFormField(
//                   autofocus: widget.autofocus,
//                   textInputAction: widget.textInputAction,
//                   inputFormatters: widget.inputFormatters,
//                   style: widget.textStyle ??
//                       Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           color: widget.readOnly
//                               ? widget.readOnlyTextColor ??
//                                   AppThemes.primaryColor
//                               : AppThemes.primaryColor,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: AppThemes.fontFamily,
//                           fontSize: 15),
//                   autocorrect: widget.autocorrect,
//                   readOnly: widget.readOnly,
//                   enabled: widget.isEnabled,
//                   cursorColor: AppThemes.black,
//                   focusNode: _focusNode,
//                   obscuringCharacter: "*",
//                   enableInteractiveSelection:
//                       widget.enableInteractiveSelection ?? !widget.obscureText,
//                   enableSuggestions: widget.enableSuggestions,
//                   keyboardType: widget.type,
//                   minLines: widget.minLines,
//                   maxLines: widget.maxLines,
//                   obscureText: obscureText,
//                   textCapitalization: widget.textCapitalization,
//                   decoration: InputDecoration(
//                       floatingLabelAlignment: FloatingLabelAlignment.start,
//                       contentPadding: const EdgeInsets.only(left: 20, right: 10),
//                       prefixIconConstraints: widget.prefixIconConstraints ??
//                           const BoxConstraints(
//                             minWidth: 50,
//                             maxWidth: 50,
//                           ),
//                       suffixIconConstraints: widget.suffixIconConstraints ??
//                           const BoxConstraints(
//                             minWidth: 45,
//                             maxWidth: 45,
//                           ),
//                       // contentPadding: EdgeInsets.zero,
//                       suffixIcon: (widget.obscureText)
//                           ? GestureDetector(
//                               onTap: () {
//                                 if (widget.obscureText) {
//                                   setState(() {
//                                     obscureText = !obscureText;
//                                   });
//                                 }
//                               },
//                               child: Icon(
//                                 widget.suffixIcon ??
//                                     (obscureText
//                                         ? Icons.visibility_off_outlined
//                                         : Icons.visibility_outlined),
//                                 size: 20,
//                                 color: widget.readOnly
//                                     ? AppThemes.grey300Color
//                                     : AppThemes.primaryColor,
//                               ),
//                             )
//                           : widget.suffixIcon != null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     if (widget.suffixIconTap != null) {
//                                       widget.suffixIconTap!();
//                                     }
//                                   },
//                                   child: Icon(
//                                     widget.suffixIcon,
//                                     color: widget.readOnly
//                                         ? AppThemes.grey300Color
//                                         : AppThemes.greyColor,
//                                   ),
//                                 )
//                               : widget.suffixText,
//                       prefixIcon: (widget.prefixIcon != null)
//                           ? Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Icon(
//                                 widget.prefixIcon,
//                                 color: widget.prefixIconColor ??
//                                     AppThemes.primaryColor,
//                               ),
//                             )
//                           : widget.prefixText != (null)
//                               ? widget.prefixText
//                               : null,
//                       // prefix: widget.prefixType == "countryPicker"
//                       //     ? Transform.translate(offset: const Offset(0, 10), child: widget.prefixWidget)
//                       //     : Padding(
//                       //         padding: const EdgeInsets.only(right: 5, bottom: 5),
//                       //         child: Transform.translate(
//                       //           offset: const Offset(0, 6),
//                       //           child: widget.prefixWidget,
//                       //         )),
//                       suffix: widget.suffixWidget,
//                       // prefixText: widget.prefixText == null && widget.prefixWidget == null ? widget.prefixStringText : null,
//                       prefixStyle:
//                           Theme.of(context).textTheme.bodyLarge!.copyWith(
//                                 color: widget.readOnly
//                                     ? AppThemes.grey300Color
//                                     : AppThemes.primaryColor,
//                               ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: widget.borderRadius ??
//                             const BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(
//                           color: widget.borderColor ?? AppThemes.borderColor,
//                           width: 1,
//                         ),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: widget.borderRadius ??
//                             const BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: const BorderSide(
//                           color: AppThemes.errorColor,
//                           width: 1,
//                         ),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: widget.borderRadius ??
//                             const BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(
//                           color: widget.borderColor ?? AppThemes.borderColor,
//                           width: 1,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: widget.borderRadius ??
//                             const BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(
//                             color: widget.borderColor ?? AppThemes.borderColor,
//                             width: 1),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderRadius: widget.borderRadius ??
//                             const BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: const BorderSide(
//                             color: AppThemes.borderColor, width: 1),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: widget.borderRadius ??
//                             const BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: const BorderSide(
//                             color: AppThemes.borderColor, width: 1),
//                       ),
//                       fillColor: widget.fillColor == (null)
//                           ? widget.readOnly
//                               ? AppThemes.white
//                               : AppThemes.primaryColor
//                           : widget.fillColor,
//                       filled: true,
//                       counterText: "",
//                       // helperText: widget.helperValue,
//                       helperText: widget.helperValue.isNullOREmpty
//                           ? null
//                           : widget.helperValue,
//                       errorStyle: const TextStyle(color: AppThemes.errorColor),
//                       labelText: widget.upperLabel,
//                       labelStyle: Theme.of(context)
//                           .textTheme
//                           .titleSmall!
//                           .copyWith(
//                               color: widget.readOnly
//                                   ? AppThemes.grey300Color
//                                   : widget.labelColor ??
//                                       AppThemes.grey200Color),
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       alignLabelWithHint: false,
//                       floatingLabelStyle: const TextStyle(letterSpacing: 0),
//                       hintText: widget.hintValue,
//                       hintStyle: widget.hintTextStyle ??
//                           Theme.of(context).textTheme.titleSmall!.copyWith(
//                               color: widget.readOnly
//                                   ? AppThemes.grey300Color
//                                   : AppThemes.grey200Color)),
//                   validator: widget.validator,
//                   controller: widget.controller,
//                   onChanged: widget.onChanged,
//                   maxLength: widget.maxLength,
//                   onFieldSubmitted: widget.onSubmit,
//                   onEditingComplete: widget.onEditingComplete,
//                   onTapOutside: (event) {
//                     FocusManager.instance.primaryFocus?.unfocus();
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:purpose_payment/utilities/app_exports.dart';

// Reusable TextField Widget
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon; // Prefix icon
  final bool readOnly; // NEW: read-only field

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.readOnly = false, // default is editable
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly, // 👈 apply readOnly here
          decoration: InputDecoration(
            filled: true,
            fillColor: AppThemes.backgroundColor,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black, fontFamily: "zekton"),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.black)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.orange),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.orange),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.black),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
