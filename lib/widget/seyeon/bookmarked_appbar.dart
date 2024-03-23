// study_appbar.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_record_list/src/bookmarked.dart';

class BookMarkAppBar {
  static PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/images/Icon.svg'),
        ),
      ),
      title: Container(
        margin: const EdgeInsets.only(bottom: 3),
        child: Text(
          '북마크 목록',
          style: TextStyle(
            fontFamily: 'Pretendard',
            color: Color(0xFF5356FF),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      titleSpacing: -8.0,
      actions: [
        IconButton(
          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
          onPressed: () {},
          icon: SvgPicture.asset('assets/images/alarm.svg'),
        ),
        Builder(
          builder: (newContext) {
            return IconButton(
              padding: EdgeInsets.only(right: 20),
              visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/bookmark.svg'),
            );
          },
        ),
      ],
    );
  }
}
