import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';

class DropdownWidget extends StatefulWidget {
  final dynamic items; // Can be List<String?> or List<Map<String, dynamic>>
  final String? hintText, keyValue;
  final Function(dynamic)? onChange;
  final bool allowDecoration;
  final String? Function(dynamic)? validator;
  final bool? enable;
  final dynamic initialValue; // ✅ Added for initial selected value

  const DropdownWidget({
    super.key,
    required this.items,
    this.initialValue, // ✅ Finalized instead of mutable value
    this.keyValue,
    required this.hintText,
    this.onChange,
    this.allowDecoration = false,
    this.enable,
    this.validator,
    String? value,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  dynamic selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue; // ✅ Initialize state from widget
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          padding: EdgeInsets.zero,
          dropdownColor: AppThemes.borderColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppThemes.borderColor,
              ),
            ),
            enabled: widget.enable ?? true,
            // ✅ Ensure enabled state works
            isDense: true,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              color: AppThemes.black,
            ),

            filled: widget.allowDecoration,
            fillColor: widget.allowDecoration ? AppThemes.borderColor : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: widget.allowDecoration ? AppThemes.white : Colors.transparent,
              ),
            ),
          ),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            color: AppThemes.black,
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          value: selectedValue,
          hint: Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.hintText ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                  color: AppThemes.black,
                )),
          ),
          items: (widget.items != null && widget.items.isNotEmpty) ? _buildDropdownItems() : null,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
            if (widget.onChange != null) {
              widget.onChange!(newValue);
            }
          },
          validator: widget.validator,
        ),
      ),
    );
  }

  List<DropdownMenuItem<dynamic>> _buildDropdownItems() {
    if (widget.items is List<String?>) {
      return (widget.items as List<String?>).map((e) {
        return DropdownMenuItem<String?>(
          value: e,
          child: Text(
            e ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              color: AppThemes.black,
            ),
          ),
        );
      }).toList();
    } else if (widget.items is List<Map<String, dynamic>>) {
      return (widget.items as List<Map<String, dynamic>>).map((e) {
        final label = e['name'] is Map<String, dynamic> ? e['name'] : e['name'] ?? '';
        return DropdownMenuItem<Map<String, dynamic>>(
          value: e,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              color: AppThemes.black,
            ),
          ),
        );
      }).toList();
    } else {
      debugPrint('Unsupported items type: ${widget.items.runtimeType}');
      throw Exception('Unsupported items type');
    }
  }
}
