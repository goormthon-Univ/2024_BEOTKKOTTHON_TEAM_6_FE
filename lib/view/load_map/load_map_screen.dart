import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/load_map/widget/challenge_notice_card.dart';
import 'package:rebook/view/load_map/widget/ongoing_animated_challenge.dart';
import 'package:rebook/view_model/load_map/load_map_view_model.dart';
import 'package:rebook/widget/button/custom_icon_button.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:rebook/widget/dialog/challenge_dialog.dart';
import 'package:rebook/widget/dialog/quiz_dialog.dart';

class LoadMapScreen extends BaseScreen<LoadMapViewModel> {
  final ScrollController _scrollController = ScrollController();

  LoadMapScreen({super.key}) {
    // '진행중'인 챌린지 위치로 초기 스크롤 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        // 화면의 높이 절반을 계산
        final screenHeight = Get.height;
        final position = _calculateChallengePosition();
        _scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // 여기에서 스크롤 위치 계산 로직을 구현
  double _calculateChallengePosition() {
    /// 하드코딩이므로 수정 필요
    const double itemHeight = 100.0; // 항목의 높이
    const double connectLineHeight = 24.0; // 연결선의 높이
    final double screenHeight = Get.height; // 화면의 높이

    // 완료된 항목과 미완성 항목의 총 높이 계산
    const double completedItemsHeight =
        5 * itemHeight + 4 * connectLineHeight;
    const double upcomingItemsHeight =
        5 * itemHeight + 4 * connectLineHeight;

    const double beforeOngoingHeight = completedItemsHeight + connectLineHeight;

    // 스크롤해야 하는 위치 계산
    final double scrollToPosition =
        beforeOngoingHeight - (screenHeight / 2) + (itemHeight / 2);

    return scrollToPosition;
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(36),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        elevation: 0,
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

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return [
      // Weekly Calendar
      SliverPersistentHeader(
        pinned: true,
        delegate: NoticeDelegate(),
      ),
    ];
  }

  @override
  Widget buildBody(BuildContext context) {
    int completedItemsCount = 2; // 완료된 항목의 개수
    int upcomingItemsCount = 2; // 미완성 항목의 개수
    return ExtendedNestedScrollView(
      headerSliverBuilder: _sliverBuilder,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              for (var i = 0; i < completedItemsCount; i++) ...[
                SvgPicture.asset(
                  'assets/images/completed_challenge.svg',
                  width: 160,
                  height: 160,
                ),
                // 완료된 항목 사이에 파란색 연결선 추가
                SvgPicture.asset('assets/images/connect_1.svg'),
              ],
              OngoingAnimatedChallenge(
                onTap: () {
                  /// 홈화면 미구현이므로, 퀴즈 모달 테스트용
                  // Get.dialog(QuizDialog(category: '비닐',));
                  Get.dialog(const ChallengeDialog());
                },
              ),
              // '진행 중' 아이템 아래 파란색 연결선 추가
              SvgPicture.asset('assets/images/connect_1.svg'),
              for (var i = 0; i < upcomingItemsCount; i++) ...[
                // 미완성 항목 사이에 회색 연결선 추가
                if (i > 0) SvgPicture.asset('assets/images/connect_2.svg'),
                SvgPicture.asset(
                  'assets/images/incomplete_challenge.svg',
                  width: 160,
                  height: 160,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class NoticeDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const Column(
      children: [
        /// state 전달 필요
        ChallengeNoticeCard(),
      ],
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 17;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

