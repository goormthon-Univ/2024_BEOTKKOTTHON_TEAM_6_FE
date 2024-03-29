import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/home/component/card_container.dart';
import 'package:rebook/view/home/component/horizon_icon_text_button.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.state,
    required this.onTap,
  });

  final QuizState state;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String svgPath =
        'assets/thumbnail/recycle_${state.category.en.toLowerCase()}_${state.quizId % 2}.svg';

    return CardContainer(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _textView(),
            const Spacer(),
            SvgPicture.asset(
              svgPath,
              height: Get.height * 0.2,
            ),
            const Spacer(),
            HorizonIconTextButton(
              text: state.quizHistoryId != null ? '결과확인' : '퀴즈풀기',
              svgPath: 'assets/icons/search.svg',
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                state.category.ko,
                style: FontSystem.KR24EB.copyWith(
                  color: const Color(0xFF5356FF),
                ),
              ),
              const Text(
                '는',
                style: FontSystem.KR24EB,
              ),
            ],
          ),
          const Text(
            '분리하는 방법은\n무엇이 있을까요?',
            style: FontSystem.KR24EB,
          ),
        ],
      );
}
