import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/utility/system/color_system.dart';

class ProfileQuizHistoryCard extends StatelessWidget {
  const ProfileQuizHistoryCard({
    super.key,
    required this.index,
    required this.state,
    this.onTap,
  });

  final int index;
  final QuizHistoryState state;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: index % 2 == 0 ? 16 : 0,
          right: index % 2 == 1 ? 16 : 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorSystem.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/thumbnail/recycle_${state.category.en.toLowerCase()}_${state.id! % 2}.svg',
            height: 120,
          ),
        ),
      ),
    );
  }
}
