import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/widget/button/rounded_rectangle_text_button.dart';
import 'package:shimmer/shimmer.dart';

class QuizDialog extends StatelessWidget {
  const QuizDialog({
    super.key,
    required this.isLoading,
    required this.state,
    required this.onTapChoice,
    required this.onGiveUpOrExit,
  });

  final bool isLoading;
  final QuizHistoryState state;
  final Function(bool) onTapChoice;
  final Function()? onGiveUpOrExit;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width * 0.8,
        height: Get.height * 0.5,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            _titleView(),
            _contentView(),
            const SizedBox(height: 20),
            _middleView(),
            const SizedBox(height: 20),
            _giveUpOrExitButton(),
          ],
        ),
      ),
    );
  }

  Widget _titleView() {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: _skeletonLoader(
          width: Get.width * 0.8 - 40,
          height: 28,
          borderRadius: 12,
        ),
      );
    }

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            state.category.ko,
            style: FontSystem.KR24EB.copyWith(
              color: const Color(0xFF5356FF),
            ),
          ),
          const Text(
            " 퀴즈풀기",
            style: FontSystem.KR24EB,
          ),
        ],
      ),
    );
  }

  Widget _contentView() {
    if (isLoading) {
      return _skeletonLoader(
        width: Get.width * 0.8 - 40,
        height: 100,
        borderRadius: 12,
      );
    }
    return Container(
      width: Get.width * 0.8 - 40,
      height: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF5356FF),
      ),
      child: Center(
        child: Text(
          state.content,
          style: FontSystem.KR20M.copyWith(
            color: ColorSystem.white,
          ),
        ),
      ),
    );
  }

  Widget _middleView() {
    if (isLoading) {
      return _skeletonLoader(
        width: Get.width * 0.8 - 40,
        height: Get.height * 0.5 - (60 + 100 + 60 + 40 + 40),
        borderRadius: 12,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: Get.height * 0.5 - (60 + 100 + 60 + 40 + 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  onTapChoice(true);
                },
                child: SvgPicture.asset(
                  'assets/images/quiz_choice_right.svg',
                  height: Get.height * 0.1,
                  colorFilter:
                      state.userAnswer != null && state.userAnswer == true
                          ? null
                          : ColorFilter.mode(
                              ColorSystem.black.withOpacity(0.2),
                              BlendMode.srcIn,
                            ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTapChoice(false);
                },
                child: SvgPicture.asset(
                  'assets/images/quiz_choice_not_right.svg',
                  height: Get.height * 0.1,
                  colorFilter:
                      state.userAnswer != null && state.userAnswer == false
                          ? null
                          : ColorFilter.mode(
                              ColorSystem.black.withOpacity(0.2),
                              BlendMode.srcIn,
                            ),
                ),
              ),
            ],
          ),
          if (state.userAnswer != null && state.validAnswer != null)
            const Spacer(),
          if (state.userAnswer != null && state.validAnswer != null)
            SvgPicture.asset(
              state.userAnswer == state.validAnswer
                  ? 'assets/images/quiz_result_correct.svg'
                  : 'assets/images/quiz_result_not_correct.svg',
              height: 32,
            )
        ],
      ),
    );
  }

  Widget _giveUpOrExitButton() {
    if (isLoading) {
      return _skeletonLoader(
        width: Get.width * 0.8 - 40,
        height: 60,
        borderRadius: 12,
      );
    }

    if (state.userAnswer == null) {
      return RoundedRectangleTextButton(
        text: '포기 하기',
        textStyle: FontSystem.KR20B.copyWith(
          color: ColorSystem.white,
        ),
        width: Get.width * 0.8 - 40,
        height: 60,
        backgroundColor: const Color(0xFF5356FF),
        foregroundColor: ColorSystem.white,
        onPressed: onGiveUpOrExit,
      );
    } else {
      return RoundedRectangleTextButton(
        text: '확인 완료',
        textStyle: FontSystem.KR20B.copyWith(
          color: ColorSystem.white,
        ),
        width: Get.width * 0.8 - 40,
        height: 60,
        backgroundColor: const Color(0xFF5356FF),
        foregroundColor: ColorSystem.white,
        onPressed: onGiveUpOrExit,
      );
    }
  }

  Widget _skeletonLoader({
    required double width,
    required double height,
    required double borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: ColorSystem.grey[200]!,
      highlightColor: ColorSystem.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.grey),
      ),
    );
  }
}
