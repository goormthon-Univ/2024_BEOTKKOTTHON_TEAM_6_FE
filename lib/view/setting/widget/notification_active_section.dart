import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view/setting/component/section_item.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class NotificationActiveSection extends BaseWidget<RootViewModel> {
  const NotificationActiveSection({super.key});

  @override
  Widget buildView(BuildContext context) {
    return SectionItem(
      children: [
        const Text(
          "알림 설정",
          style: FontSystem.KR16B,
        ),
        const Spacer(),
        SizedBox(
          width: 44,
          height: 24,
          child: Obx(
            () => Switch(
              value: viewModel.userState.isActiveNotification,
              onChanged: (value) {
                viewModel.onIsAlarmSwitch();
              },
              activeColor: ColorSystem.white,
              activeTrackColor: const Color(0xffADAEFF),
              inactiveThumbColor: ColorSystem.white,
              inactiveTrackColor: ColorSystem.grey,
              trackOutlineColor:
                  MaterialStateProperty.all(ColorSystem.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
