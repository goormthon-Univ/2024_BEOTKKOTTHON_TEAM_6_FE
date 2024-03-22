import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/home/widget/character_card.dart';
import 'package:rebook/view/home/widget/home_user_view.dart';
import 'package:rebook/view/home/widget/quiz_card.dart';
import 'package:rebook/view_model/home/home_view_model.dart';
import 'package:rebook/widget/button/custom_icon_button.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  bool get wrapWithInnerSafeArea => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/appbar_rebook_logo.svg'),
            Row(
              children: [
                CustomIconButton(
                  assetPath: 'assets/icons/appbar_alarm.svg',
                  onPressed: () {
                    // 알람 버튼이 탭됐을 때의 동작 구현
                  },
                ),
                CustomIconButton(
                  assetPath: 'assets/icons/appbar_bookmark.svg',
                  onPressed: () {
                    // 검색 버튼이 탭됐을 때의 동작 구현
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        const HomeUserView(),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: Get.height * 0.5 + 40,
          child: PageView(
            controller: controller.pageController,
            children: [
              CharacterCard(),
              QuizCard(),
              QuizCard(),
              QuizCard(),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomButton(
                svgPath: 'assets/icons/image_wallpaper.svg',
                text: '사진으로 알아보기',
                onTap: () {
                  LogUtil.info('사진으로 알아보기');
                },
              ),
              _bottomButton(
                svgPath: 'assets/icons/study_book.svg',
                text: '공부기록 보러가기',
                onTap: () {
                  LogUtil.info('공부기록 보러가기');
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 132,
        )
      ],
    );
  }

  Widget _bottomButton({
    required String svgPath,
    required String text,
    required Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: (Get.width - 52) * 0.5,
          height: 100,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF5356FF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                height: 32,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const Spacer(),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}
