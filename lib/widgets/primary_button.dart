import 'package:purpose_payment/utilities/app_exports.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? backgroundColor;

  const PrimaryButton(
      {required this.text,
      required this.onPressed,
      Key? key,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? const Color(0xFFF4F0E9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: Color(0xFFDC6D02)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text,
                style: TextStyle(
                    fontSize: 16, fontFamily: "Zekton", color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
