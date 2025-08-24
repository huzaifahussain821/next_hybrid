import 'package:purpose_payment/screens/notification/notification_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';

/// Notification Card Widget
class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAE6CF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(notification.image),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  notification.title,
                  style: const TextStyle(
                    fontFamily: "zekton",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                notification.time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "zekton",
                ),
              ),
              const SizedBox(width: 6),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.black,
                child: Text(
                  notification.count.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "zekton",
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// Message preview
          Text(
            notification.message,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontFamily: "zekton",
            ),
          ),
        ],
      ),
    );
  }
}
