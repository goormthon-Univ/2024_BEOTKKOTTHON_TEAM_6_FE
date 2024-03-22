import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view_model/challenge_authentication/challenge_authentication_view_model.dart';

class ResultFragment extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ResultFragment({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => true;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Obx(() {
          if (viewModel.isAnalysisResult == null) {
            return SvgPicture.asset(
              "assets/icons/server_communication_error.svg",
            );
          }

          return SvgPicture.asset(
            viewModel.isAnalysisResult!
                ? "assets/icons/clear_challenge.svg"
                : "assets/icons/failed_challenge.svg",
          );
        }),
        const SizedBox(height: 40),
        Center(
          child: Obx(() {
            if (viewModel.isAnalysisResult == null) {
              return Text(
                "서버 통신에 실패했어요. 잠시 후 다시 시도해주세요.",
                style: FontSystem.KR20B,
                textAlign: TextAlign.center,
              );
            }

            return Text(
              viewModel.isAnalysisResult!
                  ? "이미지 인식완료!\n카테고리의 재활용 방법을 눌러보세요."
                  : "제출한 사진이\n잘못된 것 같아요.",
              style: FontSystem.KR20B,
              textAlign: TextAlign.center,
            );
          }),
        ),
        const SizedBox(height: 40),
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
              backgroundColor: ColorSystem.blue[500]!,
              textStyle: FontSystem.KR20M,
              foregroundColor: ColorSystem.white,
              side: BorderSide(
                color: ColorSystem.green[500]!,
                width: 1,
              ),
            ),
            child: const Text("확인"),
          ),
        )
      ],
    );
  }
}
