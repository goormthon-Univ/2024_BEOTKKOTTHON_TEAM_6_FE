import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:rebook/utility/system/color_system.dart';

class OngoingAnimatedChallenge extends StatefulWidget {
  final Function() onTap;
  const OngoingAnimatedChallenge({
    required this.onTap,
    super.key,
  });

  @override
  _OngoingAnimatedChallengeState createState() =>
      _OngoingAnimatedChallengeState();
}

class _OngoingAnimatedChallengeState extends State<OngoingAnimatedChallenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/ongoing_challenge.svg',
            width: 160,
            height: 160,
          ),
          CustomPaint(
            size: const Size(155, 155),
            painter: AnimatingCircle(_controller),
          ),
        ],
      ),
    );
  }
}

class AnimatingCircle extends CustomPainter {
  final Animation<double> animation;

  AnimatingCircle(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCenter(
        center: size.center(Offset.zero),
        width: size.width,
        height: size.height);

    final Gradient gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: math.pi * 2,
      colors: [
        ColorSystem.blue[700]!,
        ColorSystem.blue.withOpacity(0.2),
      ],
      stops: [0.0, 1.0],
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    /// 반시계 방향으로 회전
    canvas.rotate(-math.pi / 2 - 2 * math.pi * animation.value);
    canvas.translate(-size.width / 2, -size.height / 2);

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
