import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view_model/study_by_image/study_by_image_view_model.dart';

class ImageInputFragment extends BaseScreen<StudyByImageViewModel> {
  const ImageInputFragment({super.key});

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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => viewModel.image == null
              ? Expanded(
                  child: Center(
                    child: Container(
                      color: ColorSystem.grey[200],
                    ),
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
              style: TextButton.styleFrom(
                textStyle: FontSystem.KR20M.copyWith(color: ColorSystem.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color(0xFF5356FF),
                foregroundColor: ColorSystem.white,
              ),
              child: const Text("사진 선택하기"),
            ),
          ),
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
                  : const Color(0xFF5356FF);
              BorderSide? side = viewModel.image == null
                  ? BorderSide(color: ColorSystem.grey)
                  : null;

              return TextButton(
                onPressed:
                    viewModel.image == null ? null : viewModel.analysisImage,
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
                  "사진 분석하기".tr,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
