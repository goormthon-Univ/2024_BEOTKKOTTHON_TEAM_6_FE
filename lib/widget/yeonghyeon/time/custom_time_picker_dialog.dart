import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color_system.dart';
import '../font_system.dart';
import 'custom_time_picker.dart';

class CustomTimePickerDialog extends StatelessWidget {
  const CustomTimePickerDialog({
    super.key,
    required this.hour,
    required this.minute,
    required this.onConfirm,
    required this.onCancel,
  });

  final int hour;
  final int minute;
  final Function(int hour, int minute) onConfirm;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: BoxConstraints(
          minHeight: Get.height * 0.4,
          maxHeight: Get.height * 0.5,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              '${"알람 시간".tr} ${"설정".tr}',
              style: FontSystem.KR20B,
            ),
            Expanded(
              child: CustomTimePicker(
                hour: hour,
                minute: minute,
                onConfirm: onConfirm,
                onCancel: onCancel,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
