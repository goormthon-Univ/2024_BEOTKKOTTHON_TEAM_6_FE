// recycle_button.dart

import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final double fontSize;
  final FontWeight fontWeight;

  const MyButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.normal, // 기본값으로 normal을 사용합니다.
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isWhiteBackground = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 40,
      child: TextButton(
        onPressed: () {
          setState(() {
            isWhiteBackground = !isWhiteBackground;
          });
          widget.onPressed();
        },
        style: TextButton.styleFrom(
          backgroundColor: isWhiteBackground ? Colors.white : Color(0xFF5356FF),
          side: BorderSide(
            color: Color(0xFF5356FF),
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: isWhiteBackground ? Color(0xFF5356FF) : Colors.white,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
