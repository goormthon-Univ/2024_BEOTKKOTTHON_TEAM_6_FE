import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/home/widget/character_card.dart';
import 'package:rebook/view/home/widget/home_user_view.dart';
import 'package:rebook/view/home/widget/quiz_card.dart';
import 'package:rebook/view/home/component/vertical_icon_text_button.dart';
import 'package:rebook/view_model/home/home_view_model.dart';
import 'package:rebook/widget/appbar/default_svg_appbar.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  bool get wrapWithInnerSafeArea => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultSvgAppBar(
        svgPath: 'assets/images/appbar_rebook_logo.svg',
        height: 24,
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
          child: Obx(
            () => PageView.builder(
              controller: controller.pageController,
              itemCount: viewModel.cardStates.length,
              itemBuilder: (context, index) {
                if (viewModel.cardStates[index].isCharacterCard) {
                  return const CharacterCard();
                } else {
                  return QuizCard(
                    state: viewModel.cardStates[index].quizState!,
                  );
                }
              },
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalIconTextButton(
                svgPath: 'assets/icons/image_wallpaper.svg',
                text: '사진으로 알아보기',
                onPressed: () {
                  LogUtil.info('사진으로 알아보기');
                },
              ),
              VerticalIconTextButton(
                svgPath: 'assets/icons/study_book.svg',
                text: '공부기록 보러가기',
                onPressed: () {
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
}
