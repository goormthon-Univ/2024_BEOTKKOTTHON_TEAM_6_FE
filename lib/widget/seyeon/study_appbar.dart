// study_appbar.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyAppBar {
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
        child: SvgPicture.asset('assets/images/REBOOK.svg'),
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
              onPressed: () {
                Navigator.of(newContext).pushNamed('/bookmarked');
              },
              icon: SvgPicture.asset('assets/images/bookmark.svg'),
            );
          },
        ),
      ],
    );
  }
}
