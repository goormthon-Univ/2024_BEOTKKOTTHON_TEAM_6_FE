import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/model/challenge_room/challenge_room_user_state.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
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
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: _leadingWidget(),
        title: SvgPicture.asset('assets/images/appbar_challenge_logo.svg'),
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
    String getImagePath(int index) {
      switch (index) {
        case 0:
          return 'assets/images/room_user_1.svg';
        case 1:
          return 'assets/images/room_user_2.svg';
        case 2:
          return 'assets/images/room_user_3.svg';
        case 3:
          return 'assets/images/room_user_4.svg';
        default:
          return 'assets/images/room_user_1.svg';
      }
    }

    Widget categoryImages(List<StudyHistories> studyHistories) {
      List<Widget> rows = [];
      for (int i = 0; i < studyHistories.length; i += 2) {
        List<Widget> rowChildren = [
          // Always add the first SVG image in the pair
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              'assets/thumbnail/recycle_${studyHistories[i].category.toLowerCase()}_1.svg',
              height: 50,
            ),
          ),
        ];

        if (i + 1 < studyHistories.length) {
          rowChildren.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: SvgPicture.asset(
                'assets/thumbnail/recycle_${studyHistories[i + 1].category.toLowerCase()}_0.svg',
                height: 50,
              ),
            ),
          );
        }
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: rowChildren,
          ),
        );
      }
      return Column(
        children: rows,
      );
    }

    return Obx(() => GridView.builder(
          itemCount: controller.challengeStates.length - 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0 / 1.85,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            var challengeRoomUser = viewModel.getChallengeRoomState(index);

            return Container(
              constraints: const BoxConstraints(minHeight: 200),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorSystem.blue,
                  width: 1,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        getImagePath(index),
                        height: 70,
                      ),
                      SizedBox(width: 8),
                      Text(
                        challengeRoomUser.userNickname,
                        style:
                            FontSystem.KR18B.copyWith(color: ColorSystem.blue),
                      ),
                      // Expanded(
                      //   child: categoryImages(challengeRoomUser.studyHistories),
                      // ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
