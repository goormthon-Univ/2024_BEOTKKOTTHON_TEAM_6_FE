import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/model/loadmap/challenge_detail_state.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/provider/base/base_web_socket.dart';
import 'package:rebook/utility/static/app_routes.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/load_map/widget/round_rectangle_timer_box.dart';
import 'package:rebook/widget/button/rounded_rectangle_text_button.dart';

class ChallengeDialog extends StatelessWidget {
  final ChallengeDetailState challengeDetail; // 챌린지 세부 정보
  final int challengeId;
  ChallengeDialog({
    super.key,
    required this.challengeDetail,
    required this.challengeId,
  });

  final ChallengeController controller = Get.put(ChallengeController());

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
            Obx(() => controller.isMatchingComplete.value
                ? SvgPicture.asset('assets/images/matching_succeed.svg')
                : SvgPicture.asset('assets/images/challenge_start.svg')),
            const SizedBox(height: 40),
            Obx(() => controller.isTimerActive.value
                ? RoundedRectangleTimerBox(
                    isActive: controller.isTimerActive.value,
                    isMatchingComplete: controller.isMatchingComplete.value,
                    onMatchSuccess: () {
                      // 매칭 성공 처리
                      Get.toNamed(
                        Routes.CHALLENGE_AUTHENTICATION,
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      challengeDetail.description,
                      style: FontSystem.KR24B.copyWith(color: ColorSystem.blue),
                    ),
                  )),
            const SizedBox(height: 10),
            Obx(() => RoundedRectangleTextButton(
                  text: controller.buttonText.value,
                  onPressed: () {
                    if (!controller.isTimerActive.value) {
                      controller.checkParticipationAndInitiate(
                          challengeDetail, challengeId);
                    } else {
                    }
                  },
                  width: widthWithoutPadding,
                  height: 48,
                  backgroundColor: challengeDetail.canParticipate
                      ? ColorSystem.blue
                      : ColorSystem.grey,
                  foregroundColor: ColorSystem.white,
                )),
          ],
        ),
      ),
    );
  }
}

class ChallengeController extends GetxController {
  var isTimerActive = false.obs;
  var isMatchingComplete = false.obs;
  var buttonText = '시작하기'.obs;
  final WebSocketController webSocketController = Get.find();
  // final ChallengeState challengeState = Get.find<ChallengeState>(id);
  final ChallengeDetailState state = Get.find<ChallengeDetailState>();
  @override
  void onInit() {
    super.onInit();
    if (!state.canParticipate) {
      buttonText.value = '이미 참여 중...';
    }
  }

  void initiateMatching(int challengeId) {
    webSocketController.subscribeToChannel(challengeId);
    buttonText.value = '매칭중...';
    startTimer(180);
  }

  void checkParticipationAndInitiate(
      ChallengeDetailState challengeDetail, int challengeId) {
    if (challengeDetail.canParticipate) {
      initiateMatching(challengeId);
    } else {
      buttonText.value = "이미 챌린지 진행중...";
    }
  }

  void startTimer(int seconds) {
    isTimerActive.value = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
        isTimerActive.value = false;
        completeMatching();
      } else {
        seconds--;
      }
    });
  }

  void completeMatching() {
    isMatchingComplete.value = true;
    buttonText.value = '매칭완료!';

    _showSnackBar(
      title: '매칭완료!',
      message: '챌린지룸으로 이동합니다!',
    );

    Future.delayed(Duration(seconds: 2), () {
      Get.close(1);
      Get.toNamed(Routes.MATCHING);
    });
  }

  void _showSnackBar({
    required String title,
    required String message,
    Color? textColor,
  }) {
    Get.snackbar(
      title,
      message,
      colorText: textColor ?? ColorSystem.black,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      duration: const Duration(seconds: 2),
      backgroundColor: ColorSystem.grey.withOpacity(0.3),
    );
  }
}
