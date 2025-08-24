import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function onPressed;

  const SignInButton(
      {required this.text, this.icon, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF4F0E9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: Color(0xFFDC6D02)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: Colors.black),
          SizedBox(width: 8),
          Text(text,
              style: TextStyle(
                  fontSize: 16, fontFamily: "Zekton", color: Colors.black)),
        ],
      ),
    );
  }
}
