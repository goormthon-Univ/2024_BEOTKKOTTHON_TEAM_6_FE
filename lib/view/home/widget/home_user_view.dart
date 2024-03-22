import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class HomeUserView extends BaseWidget<RootViewModel> {
  const HomeUserView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 52,
              height: 52,
              color: ColorSystem.white,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  SvgPicture.asset(
                    'assets/thumbnail/profile_character_green.svg',
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Obx(
            () => Text(
              viewModel.userState.nickname,
              style: FontSystem.KR24EB,
            ),
          ),
        ],
      ),
    );
  }
}
