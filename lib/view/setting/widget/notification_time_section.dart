import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view/setting/component/section_item.dart';
import 'package:rebook/view/setting/widget/custom_time_picker_dialog.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class NotificationTimeSection extends BaseWidget<RootViewModel> {
  const NotificationTimeSection({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => SectionItem(
        onTap: viewModel.userState.isActiveNotification
            ? () {
                Get.dialog(CustomTimePickerDialog(
                  hour: viewModel.userState.notificationHour,
                  minute: viewModel.userState.notificationMinute,
                  onCancel: () {
                    Get.back();
                  },
                  onConfirm: (hour, minute) {
                    viewModel.changeAlarmTime(hour, minute);
                    Get.back();
                  },
                ));
              }
            : null,
        children: [
          Text(
            "알림 시간",
            style: viewModel.userState.isActiveNotification
                ? FontSystem.KR16B
                : FontSystem.KR16R.copyWith(color: ColorSystem.grey[400]),
          ),
          const Spacer(),
          Text(
            // 00 : 00 형태로 표시
            "${viewModel.userState.notificationHour.toString().padLeft(2, '0')}:${viewModel.userState.notificationMinute.toString().padLeft(2, '0')}",
            style: viewModel.userState.isActiveNotification
                ? FontSystem.KR16R.copyWith(color: ColorSystem.grey[700])
                : FontSystem.KR16R.copyWith(color: ColorSystem.grey[400]),
          ),
          const SizedBox(
            width: 4,
          ),
          SvgPicture.asset(
            'assets/icons/right.svg',
            width: 16,
            colorFilter: viewModel.userState.isActiveNotification
                ? null
                : ColorFilter.mode(ColorSystem.grey[400]!, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
