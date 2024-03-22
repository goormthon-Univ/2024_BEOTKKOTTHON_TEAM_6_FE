
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/challenge_authentication/fragment/result_fragment.dart';
import 'package:rebook/view_model/challenge_authentication/challenge_authentication_view_model.dart';

import 'fragment/image_input_fragment.dart';

class ChallengeAuthenticationScreen
    extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ChallengeAuthenticationScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(36),
      child: AppBar(
        centerTitle: true, // 로고를 중앙에 배치
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: _leadingWidget(),
        title: SvgPicture.asset('assets/images/appbar_challenge_logo.svg'), // 로고
      ),
    );
  }

  Widget? _leadingWidget() {
    if (viewModel.currentPageIndex == 0) {
      return IconButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/arrow_back_blue.svg",
          width: 24,
          height: 24,
        ),
        onPressed: () {
          Get.back();
        },
      );
    } else {
      return null;
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
      child: PageView(
        controller: viewModel.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ImageInputFragment(),
          LoadingFragment(),
          ResultFragment(),
        ],
      ),
    );
  }
}
