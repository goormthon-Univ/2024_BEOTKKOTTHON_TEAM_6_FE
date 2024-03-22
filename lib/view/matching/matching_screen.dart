import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view_model/matching/matching_view_model.dart';

class MatchingScreen extends BaseScreen<MatchingViewModel> {
  const MatchingScreen({super.key});

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

  Widget _leadingWidget() {
    return IconButton(
      icon: SvgPicture.asset('assets/icons/arrow_back_blue.svg'),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        childAspectRatio: 0.5, // square items
      ),
      itemCount: 4, // 4 items
      itemBuilder: (context, index) {
        Alignment alignment;
        switch (index) {
          case 0:
            alignment = Alignment.bottomRight;
            break;
          case 1:
            alignment = Alignment.bottomLeft;
            break;
          case 2:
            alignment = Alignment.topRight;
            break;
          case 3:
            alignment = Alignment.topLeft;
            break;
          default:
            alignment = Alignment.center;
        }
        return Stack(
          alignment: alignment,
          children: [
            SvgPicture.asset('assets/images/matching_item_net.svg'), // Net background
            Positioned(
              child: SvgPicture.asset('assets/images/matching_character.svg'), // Character
            ),
          ],
        );
      },
    );
  }
}
