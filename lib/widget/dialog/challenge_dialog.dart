import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/static/app_routes.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/load_map/widget/round_rectangle_timer_box.dart';
import 'package:rebook/widget/button/rounded_rectangle_text_button.dart';

class ChallengeDialog extends StatefulWidget {
  const ChallengeDialog({Key? key}) : super(key: key);

  @override
  State<ChallengeDialog> createState() => _ChallengeDialogState();
}

class _ChallengeDialogState extends State<ChallengeDialog> {
  bool isTimerActive = false;
  bool isMatchingComplete = false;

  // 타이머를 시작하는 함수
  void _startTimer() {
    setState(() {
      isTimerActive = true;
    });
  }

  // '시작하기' 버튼 눌렀을 때의 동작
  void _onPressedButton() {
    setState(() {
      isTimerActive = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          isMatchingComplete = true;
        });
      }
    });
  }


  void _onMatchingSuccessPressed() {
    /// 매칭 성공시 이동
    // Get.toNamed(Routes.MATCHING);
    Get.toNamed(
      Routes.CHALLENGE_AUTHENTICATION,
      // arguments: state!.type,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = Get.width * 0.8;
    double widthWithoutPadding = Get.width * 0.8 - 32;

    return Dialog(
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/modal_challenge_logo.svg'),
            const SizedBox(height: 40),
            isMatchingComplete
                ? SvgPicture.asset('assets/images/matching_succeed.svg')
                : SvgPicture.asset('assets/images/challenge_start.svg'),
            const SizedBox(height: 50),
            /// layout shift 방지 isTimerActive로 조건 추가
            isTimerActive
                ? RoundedRectangleTimerBox(
                isActive: isTimerActive, // Pass whether the timer should be active
                isMatchingComplete: isMatchingComplete,
                onMatchSuccess: _onMatchingSuccessPressed,
                  )
                : const SizedBox(height: 48),
            const SizedBox(height: 10),
            RoundedRectangleTextButton(
              text: isTimerActive ? '취소하기' : '시작하기',
              textStyle: FontSystem.KR16B.copyWith(
                color: ColorSystem.white,
              ),
              onPressed: () {
                if (isTimerActive) {
                  Get.back();
                } else {
                  _onPressedButton();
                }
              },
              width: widthWithoutPadding,
              height: 48,
              backgroundColor: ColorSystem.blue,
              foregroundColor: ColorSystem.white,
            ),
          ],
        ),
      ),
    );
  }
}
