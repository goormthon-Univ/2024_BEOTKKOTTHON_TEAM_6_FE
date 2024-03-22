import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';

class RoundedRectangleTimerBox extends StatefulWidget {
  final bool isActive;
  final bool isMatchingComplete;
  final Function()? onMatchSuccess;

  const RoundedRectangleTimerBox({
    super.key,
    required this.isActive,
    required this.isMatchingComplete,
    this.onMatchSuccess,
  });

  @override
  State<RoundedRectangleTimerBox> createState() => _RoundedRectangleTimerBoxState();
}

class _RoundedRectangleTimerBoxState extends State<RoundedRectangleTimerBox> {
  Timer? _timer;
  int _start = 180;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    manageTimerBasedOnActivity();
  }

  @override
  void didUpdateWidget(RoundedRectangleTimerBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    manageTimerBasedOnActivity();
  }

  void manageTimerBasedOnActivity() {
    if (widget.isActive && !_timerIsActive() && !widget.isMatchingComplete) {
      startTimer();
    } else if (!widget.isActive && _timerIsActive()) {
      stopTimer();
    }
  }

  bool _timerIsActive() {
    return _timer != null && _timer!.isActive;
  }

  void startTimer() {
    setState(() {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (_start == 0) {
          stopTimer();
          if (widget.onMatchSuccess != null && !widget.isMatchingComplete) {
            widget.onMatchSuccess!();
          }
        } else {
          setState(() {
            _start--;
          });
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      _timer?.cancel();
      _timer = null;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(double.infinity, 48),
        ),
        textStyle: MaterialStateProperty.all(
          FontSystem.KR20M.copyWith(color: ColorSystem.white),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
                color: ColorSystem.blue, width: 1), // 테두리 색상 설정
          ),
        ),
        backgroundColor:
        MaterialStateProperty.all(ColorSystem.white),
        foregroundColor:
        MaterialStateProperty.all(ColorSystem.white),
      ),
      onPressed: widget.isMatchingComplete ? widget.onMatchSuccess : null,
      child: Center(
        child: widget.isMatchingComplete
            ? Text(
          "매칭성공!",
          style: FontSystem.KR18B.copyWith(
            color: ColorSystem.blue,
          ),
        )
            : widget.isActive
            ? Text(
          "${_start ~/ 60}:${(_start % 60).toString().padLeft(2, '0')}",
          style: FontSystem.KR18B.copyWith(
            color: ColorSystem.grey[900]!,
          ),
        )
            : Text(
          "매칭 실패",
          style: FontSystem.KR18B.copyWith(
            color: ColorSystem.black, // Placeholder text color
          ),
        ),
      ),
    );
  }
}

