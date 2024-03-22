import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/functions/log_util.dart';
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
                  // 로그인 성공 처리
                  LogUtil.info('로그인 성공');
                } else {
                  // 로그인 실패 처리
                  LogUtil.info('로그인 실패');
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
}
