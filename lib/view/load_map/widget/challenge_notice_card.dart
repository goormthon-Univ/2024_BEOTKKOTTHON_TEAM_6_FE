import 'package:flutter/material.dart';
import 'package:rebook/utility/system/color_system.dart';

class ChallengeNoticeCard extends StatelessWidget {
  const ChallengeNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorSystem.white,
      surfaceTintColor: ColorSystem.transparent,
      shadowColor: ColorSystem.transparent,
      margin: const EdgeInsets.all(8.0),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0.0),

          /// text 하드코딩 수정 필요(상태에 따른 로직까지!)
          child: Text(
            "오늘의 챌린지를 진행하지 않았어요!",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
