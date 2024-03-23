import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view_model/study_by_image/study_by_image_view_model.dart';
import 'package:rive/rive.dart';

class AnalysisLoadingFragment extends BaseScreen<StudyByImageViewModel> {
  const AnalysisLoadingFragment({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => true;

  @override
  Color? get screenBackgroundColor => Colors.white;

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Get.height * 0.6,
                child: RiveAnimation.asset(
                  "assets/rivs/loading_animation_earth.riv",
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  controllers: [
                    viewModel.animationController,
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        Positioned(
          top: Get.height * 0.6,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 100,
            child: Center(
              child: DefaultTextStyle(
                style: FontSystem.KR20B,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText(
                      '이미지를 분석 중 입니다',
                      textAlign: TextAlign.center,
                      duration: const Duration(seconds: 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
