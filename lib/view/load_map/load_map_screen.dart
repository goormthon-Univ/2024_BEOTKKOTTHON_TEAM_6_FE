import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/provider/base/base_web_socket.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/load_map/widget/challenge_notice_card.dart';
import 'package:rebook/view/load_map/widget/ongoing_animated_challenge.dart';
import 'package:rebook/view_model/load_map/load_map_view_model.dart';
import 'package:rebook/widget/appbar/default_svg_appbar.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

class LoadMapScreen extends BaseScreen<LoadMapViewModel> {
  var challengeId;
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

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(30),
      child: DefaultSvgAppBar(
        svgPath: 'assets/images/appbar_rebook_logo.svg',
        height: 24,
      ),
    );
  }

  /// 챌린지 상태에 따라 다른 SVG 이미지
  Widget _buildChallengeItem(ChallengeState state) {
    if (state.roomId == null) {
      return GestureDetector(
        onTap: () async {
          challengeId = viewModel.fetchChallengeDetail(state.id);
          if (challengeId != -1) {
            final controller = WebSocketController();
            controller.connectToWebSocket();
          }
        },
        child: SvgPicture.asset(
          'assets/images/incomplete_challenge.svg',
          width: 160,
          height: 160,
        ),
      );
    } else if (!state.isCurrentParticipate!) {
      return GestureDetector(
        onTap: () async {
          challengeId = viewModel.fetchChallengeDetail(state.id);
          if (challengeId != -1) {
            final controller = WebSocketController();
            controller.connectToWebSocket();
          }
        },
        child: SvgPicture.asset(
          'assets/images/completed_challenge.svg',
          width: 160,
          height: 160,
        ),
      );
    } else {
      return OngoingAnimatedChallenge(
        onTap: () async {
          challengeId = viewModel.fetchChallengeDetail(state.id);
          if (challengeId != -1) {
            final controller = WebSocketController();
            controller.connectToWebSocket();
          }
        },
      );
    }
  }

  // 여기에서 스크롤 위치 계산 로직을 구현
  double _calculateChallengePosition() {
    const double itemHeight = 100.0; // 항목의 높이
    const double connectLineHeight = 24.0; // 연결선의 높이
    final double screenHeight = Get.height; // 화면의 높이

    // 완료된 항목과 미완성 항목의 총 높이 계산
    const double completedItemsHeight = 5 * itemHeight + 4 * connectLineHeight;
    const double upcomingItemsHeight = 5 * itemHeight + 4 * connectLineHeight;

    const double beforeOngoingHeight = completedItemsHeight + connectLineHeight;

    // 스크롤해야 하는 위치 계산
    final double scrollToPosition =
        beforeOngoingHeight - (screenHeight / 2) + (itemHeight / 2);

    return scrollToPosition;
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return [
      /// 보류
      // // Weekly Calendar
      // SliverPersistentHeader(
      //   pinned: true,
      //   delegate: NoticeDelegate(),
      // ),
    ];
  }

  @override
  Widget buildBody(BuildContext context) {
    return Obx(() {
      final challengeWidgets = viewModel.challengeStates
          .map((state) => _buildChallengeItem(state.value))
          .toList();

      return ExtendedNestedScrollView(
        headerSliverBuilder: _sliverBuilder,
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
            itemCount: challengeWidgets.length * 2 - 1,
            itemBuilder: (context, index) {
              // 짝수 인덱스는 챌린지 아이템, 홀수 인덱스는 연결선
              if (index % 2 == 0) {
                // 챌린지 아이템
                return challengeWidgets[index ~/ 2];
              } else {
                // 연결선: 이전 챌린지 상태에 따라 연결선 선택
                ChallengeState previousState =
                    viewModel.challengeStates[(index - 1) ~/ 2].value;
                String lineAsset = (previousState.roomId == null ||
                        previousState.isCurrentParticipate == false)
                    ? 'assets/images/connect_2.svg'
                    : 'assets/images/connect_1.svg';
                return SvgPicture.asset(
                  lineAsset,
                );
              }
            },
          ),
        ),
      );
    });
  }
}

class NoticeDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const ChallengeNoticeCard();
  }

  @override
  double get maxExtent => 71;

  @override
  double get minExtent => 17;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
