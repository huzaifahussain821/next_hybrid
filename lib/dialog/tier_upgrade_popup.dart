import '../utilities/app_exports.dart';

class TierInfoPopup extends StatelessWidget {
  final String tierName;
  final int points;
  final VoidCallback onClose;

  const TierInfoPopup({
    super.key,
    required this.tierName,
    required this.points,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppThemes.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Orange vertical bar with icon

          Container(
            decoration: BoxDecoration(
              color: AppThemes.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(6),
            child:
                const Icon(Icons.info_outline, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 12),
          // Text Content
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                children: [
                  const TextSpan(text: "Reach "),
                  TextSpan(
                    text: tierName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: " by earning "),
                  TextSpan(
                    text: "$points",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  const TextSpan(text: " points"),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Close Icon
          GestureDetector(
            onTap: onClose,
            child: const Icon(Icons.close, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }
}

void showTierInfoDialog(BuildContext context, String tierName, int points) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(color: Colors.black54),
          ),
          Align(
            alignment: const Alignment(0, -0.4),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TierInfoPopup(
                  tierName: tierName,
                  points: points,
                  onClose: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

// void showTierInfoDialog(BuildContext context, String tierName, int points) {
//   showDialog(
//     context: context,
//     barrierDismissible: true, // tap outside to dismiss
//     builder: (context) {
//       return Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: const EdgeInsets.all(20),
//         child: TierInfoPopup(
//           tierName: tierName,
//           points: points,
//           onClose: () => Navigator.of(context).pop(),
//         ),
//       );
//     },
//   );
// }
