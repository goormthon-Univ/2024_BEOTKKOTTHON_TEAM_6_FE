import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/home/component/card_container.dart';

import 'icon_text_button.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              'assets/thumbnail/recycle_can_1.svg',
              height: Get.height * 0.2,
            ),
            const Spacer(),
            IconTextButton(
              text: '시작하기',
              svgPath: 'assets/icons/search.svg',
              onPressed: () {
                LogUtil.info('시작하기 버튼이 탭됐을 때의 동작 구현');
              },
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
                '카테고리',
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
