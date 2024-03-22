import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/utility/static/app_routes.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/view_model/login/login_view_model.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({super.key});
  LoginViewModel get viewModel => controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: InkWell(
              onTap: () async {
                bool success = await viewModel.kakaoSignInAccount();
                if (success) {
                  _showSnackBar(
                    title: '로그인 성공',
                    message: '다양한 서비스를 이용해보세요!',
                    textColor: ColorSystem.white,
                  );
                  Get.offAndToNamed(Routes.ROOT);
                } else {
                  _showSnackBar(
                    title: '로그인 실패',
                    message: '다시 시도해주세요.',
                    textColor: ColorSystem.white,
                  );
                }
              },
              child: Image.asset(
                'assets/images/kakao_login.png',
                width: Get.width * 0.8,
                // height: 50, // 필요하다면 높이도 조절할 수 있습니다.
              ),
            ),
          ),
        ),
      ),
    );
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
