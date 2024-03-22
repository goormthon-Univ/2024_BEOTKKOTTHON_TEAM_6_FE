import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view_model/challenge_authentication/challenge_authentication_view_model.dart';

class ImageInputFragment extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ImageInputFragment({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => true;

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Text(
                  '사진으로 재활용 알아보기',
                  style: FontSystem.KR20B.copyWith(color: ColorSystem.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '사진을 첨부해 재활용 방법을 알아보세요',
              style: FontSystem.KR16R.copyWith(color: ColorSystem.blue),
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => viewModel.image == null
                ? Expanded(
                    child: Center(
                      /// svg 해놧다가 색상 버그나서 우선 png
                      child: Image.asset('assets/images/empty.png'),
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Image.file(
                        File(viewModel.image!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
                width: Get.width * 0.92,
                height: 56,
                child: TextButton(
                  onPressed: viewModel.getImage,
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      FontSystem.KR20M.copyWith(color: ColorSystem.white),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: ColorSystem.blue, width: 2), // 테두리 색상 설정
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorSystem.white),
                    foregroundColor:
                        MaterialStateProperty.all(ColorSystem.white),
                  ),
                  child: Text(
                    "사진 선택하기",
                    style: FontSystem.KR20B.copyWith(color: ColorSystem.blue),
                  ),
                )),
          ),
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
              width: Get.width * 0.92,
              height: 56,
              child: Obx(() {
                TextStyle textStyle = viewModel.image == null
                    ? FontSystem.KR20M.copyWith(color: ColorSystem.grey)
                    : FontSystem.KR20M.copyWith(color: ColorSystem.white);
                Color backgroundColor = viewModel.image == null
                    ? ColorSystem.white
                    : ColorSystem.blue[300]!;
                BorderSide? side = viewModel.image == null
                    ? BorderSide(color: ColorSystem.grey)
                    : null;

                return TextButton(
                  onPressed: viewModel.image == null
                      ? null
                      : viewModel.authenticationChallenge,
                  style: TextButton.styleFrom(
                    textStyle: textStyle,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: backgroundColor,
                    foregroundColor: ColorSystem.white,
                    side: side,
                  ),
                  child: Text(
                    "인증하기",
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
