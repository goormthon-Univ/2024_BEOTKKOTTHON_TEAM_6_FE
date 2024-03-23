import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/utility/static/app_routes.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/setting/component/section_item.dart';
import 'package:rebook/view/setting/widget/logout_dialog.dart';
import 'package:rebook/view/setting/widget/notification_active_section.dart';
import 'package:rebook/view/setting/widget/notification_time_section.dart';
import 'package:rebook/view/setting/widget/withdrawal_dialog.dart';
import 'package:rebook/view_model/setting/setting_view_model.dart';
import 'package:rebook/widget/appbar/default_back_appbar.dart';
import 'package:rebook/widget/line/infinity_horizon_line.dart';

class SettingScreen extends BaseScreen<SettingViewModel> {
  const SettingScreen({super.key});
  @override
  // TODO: implement screenBackgroundColor
  Color? get screenBackgroundColor => ColorSystem.white;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "설정",
        onBackPress: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const NotificationActiveSection(),
        _paddingInfinityLine(),
        const NotificationTimeSection(),
        _paddingInfinityLine(),
        _authenticationSection(),
        _paddingInfinityLine(),
        _withdrawalSection(),
      ],
    );
  }

  Widget _paddingInfinityLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: InfinityHorizonLine(height: 1, color: ColorSystem.grey[200]),
      );

  Widget _authenticationSection() => SectionItem(
        onTap: () {
          Get.dialog(
            LogoutDialog(
              onConfirm: () {
                viewModel.logout().then((value) => {
                      _showSnackBar('로그아웃', '로그아웃 되었습니다.'),
                      Get.offAllNamed(Routes.LOGIN),
                    });
              },
              onCancel: () {
                Get.back();
              },
            ),
          );
        },
        children: [
          Text(
            "로그아웃",
            style: FontSystem.KR16B.copyWith(color: ColorSystem.pink),
          ),
        ],
      );

  Widget _withdrawalSection() => SectionItem(
        onTap: () {
          Get.dialog(
            WithdrawalDialog(
              onConfirm: () {
                viewModel.withdrawal().then((value) => {
                      _showSnackBar('회원탈퇴', '회원탈퇴 되었습니다.'),
                      Get.offAllNamed(Routes.LOGIN),
                    });
              },
              onCancel: () {
                Get.back();
              },
            ),
          );
        },
        children: [
          Text(
            "회원탈퇴".tr,
            style: FontSystem.KR16B.copyWith(color: ColorSystem.pink),
          ),
        ],
      );

  void _showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      duration: const Duration(seconds: 2),
      backgroundColor: ColorSystem.grey.withOpacity(0.3),
    );
  }
}
