import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view/home/component/card_container.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class CharacterCard extends BaseWidget<RootViewModel> {
  const CharacterCard({super.key});

  @override
  Widget buildView(BuildContext context) {
    return CardContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textView(),
          const Spacer(),
          SvgPicture.asset(
            'assets/thumbnail/card_character_green.svg',
            width: Get.width * 0.7 - 60,
          ),
        ],
      ),
    );
  }

  Widget _textView() => Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "환영합니다!",
              style: FontSystem.KR24EB,
            ),
            Row(
              children: [
                Obx(
                  () => Text(
                    viewModel.userState.nickname,
                    style: FontSystem.KR24EB.copyWith(
                      color: const Color(0xFF5356FF),
                    ),
                  ),
                ),
                const Text(
                  "님",
                  style: FontSystem.KR24EB,
                ),
              ],
            )
          ],
        ),
      );
}
