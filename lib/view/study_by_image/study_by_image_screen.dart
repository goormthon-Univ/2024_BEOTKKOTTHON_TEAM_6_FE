import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/study_by_image/fragment/analysis_loading_fragment.dart';
import 'package:rebook/view/study_by_image/fragment/image_input_fragment.dart';
import 'package:rebook/view/study_by_image/fragment/result_fragment.dart';
import 'package:rebook/view_model/study_by_image/study_by_image_view_model.dart';

class StudyByImageScreen extends BaseScreen<StudyByImageViewModel> {
  const StudyByImageScreen({super.key});

  @override
  Color? get screenBackgroundColor => Colors.white;

  @override
  bool get wrapWithInnerSafeArea => true;

  @override
  bool get setBottomInnerSafeArea => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Obx(
        () => AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '사진으로 공부하기',
              style: FontSystem.KR24B.copyWith(
                color: const Color(0xFF5356FF),
              ),
            ),
          ),
          centerTitle: false,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: viewModel.currentPageIndex == 0 ? 0 : 16,
          leadingWidth: 50,
          leading: _leadingWidget(),
        ),
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
          AnalysisLoadingFragment(),
          ResultFragment(),
        ],
      ),
    );
  }
}
