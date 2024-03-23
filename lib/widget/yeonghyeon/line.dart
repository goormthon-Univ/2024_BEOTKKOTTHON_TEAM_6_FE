import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// InfinityLine
///
/// Color and height can be set.
///
/// It is used to create a line that stretches infinitely.
class Line extends StatelessWidget {
  const Line({
    super.key,
    required this.height,
    this.color,
  });

  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 41,
      height: height,
      color: color,
    );
  }
}
