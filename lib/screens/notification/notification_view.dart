import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpose_payment/screens/notification/widgets/notification_card.dart';
import 'package:purpose_payment/themes/app_theme.dart';
import 'package:purpose_payment/utilities/app_exports.dart';

/// Notification Model
class NotificationModel {
  final String image;
  final String title;
  final String time;
  final String message;
  final int count;

  NotificationModel({
    required this.image,
    required this.title,
    required this.time,
    required this.message,
    required this.count,
  });
}

/// Controller
class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Dummy data
    notifications.addAll([
      NotificationModel(
        image: "https://i.pravatar.cc/100",
        title: "Lorem ipsum dolor",
        time: "5:45 PM",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet...",
        count: 1,
      ),
      NotificationModel(
        image: "https://i.pravatar.cc/101",
        title: "Lorem ipsum dolor",
        time: "5:45 PM",
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        count: 1,
      ),
      NotificationModel(
        image: "https://i.pravatar.cc/102",
        title: "Lorem ipsum dolor",
        time: "5:45 PM",
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        count: 1,
      ),
    ]);
  }
}

/// Main Screen
class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      appBar: AppBarWidget.backAppBar("Notifications"),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationCard(
                        notification: controller.notifications[index]);
                  },
                )),
          ),
        ],
      ),
    );
  }
}
