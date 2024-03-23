import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/static/app_routes.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class UserBriefView extends BaseWidget<RootViewModel> {
  const UserBriefView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: ColorSystem.white,
      ),
      child: Column(
        children: [
          Container(
            width: Get.width - 32,
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xff8385FF),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 66,
                        height: 66,
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
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            viewModel.userState.nickname,
                            style: FontSystem.KR24M.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () => Text(
                            viewModel.userState.encryptedId.isNotEmpty
                                ? '#${viewModel.userState.encryptedId.substring(0, 6)}'
                                : 'ID',
                            style: FontSystem.KR12R.copyWith(
                              color: const Color(0xffD4D4D4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.SETTING);
                  },
                  icon: SvgPicture.asset('assets/icons/setting.svg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
