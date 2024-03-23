// study_bookmark_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyBookmarkButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final TextStyle textStyle;

  const StudyBookmarkButton({
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.width = 398.0,
    this.height = 80.0,
    this.textStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: const Color.fromRGBO(244, 244, 244, 10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                text,
                style: textStyle,
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: SvgPicture.asset(
                iconPath,
                width: 24.0,
                height: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
