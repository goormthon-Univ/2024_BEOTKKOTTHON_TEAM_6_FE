import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view_model/study_by_image/study_by_image_view_model.dart';

class ResultFragment extends BaseScreen<StudyByImageViewModel> {
  const ResultFragment({super.key});

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Obx(() {
          return SvgPicture.asset(
            viewModel.analysisResultState != null
                ? "assets/icons/clear_challenge.svg"
                : "assets/icons/failed_challenge.svg",
          );
        }),
        const SizedBox(height: 40),
        Center(
          child: Obx(() {
            return Text(
              viewModel.analysisResultState != null
                  ? "이미지 인식완료!\n카테고리의 재활용을 둘러보세요."
                  : "잘못된 사진을 제출했어요",
              style: FontSystem.KR20B,
              textAlign: TextAlign.center,
            );
          }),
        ),
        if (viewModel.analysisResultState == null) const SizedBox(height: 20),
        if (viewModel.analysisResultState != null)
          Container(
            width: Get.width - 32,
            height: 100,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF5356FF),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: ColorSystem.grey[300]!,
                  offset: const Offset(0, 2),
                  blurRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/thumbnail/recycle_${viewModel.analysisResultState?.recycleCategory.en.toLowerCase()}_0.svg',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
        if (viewModel.analysisResultState != null &&
            viewModel.analysisResultState!.completeTodayCurrentChallenge)
          const SizedBox(height: 20),
        if (viewModel.analysisResultState != null &&
            viewModel.analysisResultState!.completeTodayCurrentChallenge)
          Text(
            "챌린지 인증 완료",
            style: FontSystem.KR20B,
            textAlign: TextAlign.center,
          ),
        const Spacer(),
        SizedBox(
          width: Get.width - 32,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              Get.back(closeOverlays: true);
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color(0xFF5356FF),
              textStyle: FontSystem.KR20M,
              foregroundColor: ColorSystem.white,
              side: BorderSide(
                color: ColorSystem.green[500]!,
                width: 1,
              ),
            ),
            child: Text("확인".tr),
          ),
        )
      ],
    );
  }
}
