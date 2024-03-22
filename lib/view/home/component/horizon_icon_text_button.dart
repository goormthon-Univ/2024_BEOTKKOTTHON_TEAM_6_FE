import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rebook/utility/system/font_system.dart';

class HorizonIconTextButton extends StatelessWidget {
  const HorizonIconTextButton({
    super.key,
    required this.text,
    required this.svgPath,
    this.onTap,
  });

  final String text;
  final String svgPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(
        Radius.circular(30.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFDADBFF),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              height: 25,
              colorFilter: const ColorFilter.mode(
                Color(0xFF5356FF),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: FontSystem.KR20M.copyWith(
                color: const Color(0xFF5356FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
