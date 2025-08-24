import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../dialog/custom_dialog.dart';

class BlockReportWidget extends StatelessWidget {
  const BlockReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              showCustomDialog(
                title: "Blocl User",
                description: "Are you sure you want to block this user?",
                icon: Icons.delete,
                iconColor: Colors.red,
                onClickedYesText: "Block",
                onClickedNoText: "Cancel",
                onClickedYes: () {
                  Get.back();
                },
                onClickedNo: () {
                  Get.back();
                },
              );
            },
            child: const Text(
              "Block User",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          5.verticalSpace,
          GestureDetector(
            onTap: () {
              // showReportUserDialog(context);
            },
            child: const Text(
              "Report User",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}