import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecycleTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment
          .center, // This will vertically center the children in the row.
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 5),
          child: SvgPicture.asset(
            'assets/images/recycle.svg',
            width: 21,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            '재활용 둘러보기',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
