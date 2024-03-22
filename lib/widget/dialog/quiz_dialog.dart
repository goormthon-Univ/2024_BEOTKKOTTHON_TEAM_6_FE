import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/widget/button/rounded_rectangle_text_button.dart';

class QuizDialog extends StatefulWidget {
  final String category;

  QuizDialog({Key? key, required this.category}) : super(key: key);

  @override
  State<QuizDialog> createState() => _QuizDialogState();
}

class _QuizDialogState extends State<QuizDialog> {
  int currentQuizIndex = 0;
  final int totalQuizCount = 3;
  List<bool?> selectedAnswers = [null, null, null]; // 사용자의 답변 저장

  // 퀴즈 질문과 정답
  final List<String> quizQuestions = [
    '뽁뽁이로 불리는 에어캡은 비닐로 분리배출한다.',
    '종이컵은 종이류로 분리배출한다.',
    '유리병은 일반 쓰레기로 버려야 한다.',
  ];
  final List<bool> quizAnswers = [true, false, false]; // 실제 정답

  void _selectAnswer(bool answer) {
    if (selectedAnswers[currentQuizIndex] == null) {
      // 답변이 아직 선택되지 않았다면
      setState(() {
        selectedAnswers[currentQuizIndex] = answer;
      });
    }
  }

  void _nextQuiz() {
    if (currentQuizIndex < totalQuizCount - 1) {
      setState(() {
        currentQuizIndex++;
        selectedAnswers[currentQuizIndex] = null; // 다음 문제의 답변을 초기화
      });
    } else {
      // 퀴즈 종료 로직
      Get.back(); // 혹은 결과 페이지로 이동
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isAnswered = selectedAnswers[currentQuizIndex] != null;
    bool isCorrectAnswer = selectedAnswers[currentQuizIndex] == quizAnswers[currentQuizIndex];
    bool isLastQuiz = currentQuizIndex == totalQuizCount - 1;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 불필요한 공간을 최소화
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/arrow_back_dialog.svg',
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.category,
                      style: FontSystem.KR28B.copyWith(color: ColorSystem.blue),
                    ),
                    TextSpan(
                      text: ' 퀴즈 풀기',
                      style:
                          FontSystem.KR28B.copyWith(color: ColorSystem.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorSystem.blue,
                  borderRadius: BorderRadius.circular(12.0), // 모서리 둥글게
                ),
                margin: const EdgeInsets.all(10), // 바깥쪽 여백
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 25,
                ), // 안쪽 패딩
                child: Text(
                  '${currentQuizIndex + 1}. "${quizQuestions[currentQuizIndex]}"',
                  style: FontSystem.KR16B.copyWith(
                    color: ColorSystem.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 80.0),
            if (isAnswered) // 답변이 선택되었다면
              Center(
                child: SvgPicture.asset(
                  isCorrectAnswer
                      ? 'assets/images/quiz_${quizAnswers[currentQuizIndex] ? '1' : '2'}_answer.svg'
                      : 'assets/images/quiz_${!quizAnswers[currentQuizIndex] ? '1' : '2'}_answer.svg',
                ),
              )
            else // 답변이 선택되지 않았다면 두 선택지 모두 보여주기
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: SvgPicture.asset('assets/images/quiz_1.svg'),
                    onTap: () => _selectAnswer(true),
                  ),
                  InkWell(
                    child: SvgPicture.asset('assets/images/quiz_2.svg'),
                    onTap: () => _selectAnswer(false),
                  ),
                ],
              ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: RoundedRectangleTextButton(
                  text: isLastQuiz ? '퀴즈 종료' : '다음 문제',
                  textStyle: FontSystem.KR18B.copyWith(color: Colors.white),
                  width: Get.width * 0.5,
                  height: 48.0,
                  backgroundColor: ColorSystem.blue,
                  onPressed: isAnswered ? _nextQuiz : null, // 답변이 선택되지 않았다면 비활성화
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}