import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/widget/button/rounded_rectangle_text_button.dart';

class WithdrawalDialog extends StatelessWidget {
  const WithdrawalDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  final Function() onConfirm;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '회원탈퇴 하시겠습니까?'.tr,
              style: FontSystem.KR20B,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: RoundedRectangleTextButton(
                    text: '취소'.tr,
                    textStyle: FontSystem.KR16B.copyWith(
                      color: ColorSystem.grey,
                    ),
                    height: 50,
                    backgroundColor: ColorSystem.white,
                    foregroundColor: ColorSystem.grey,
                    borderSide: BorderSide(
                      color: ColorSystem.grey,
                    ),
                    onPressed: onCancel,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RoundedRectangleTextButton(
                    text: '회원탈퇴'.tr,
                    textStyle: FontSystem.KR16B.copyWith(
                      color: ColorSystem.white,
                    ),
                    height: 50,
                    backgroundColor: ColorSystem.pink,
                    foregroundColor: ColorSystem.white,
                    onPressed: onConfirm,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
