import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  @override
  List<QuizState> readRandomQuizzes() {
    List<QuizState> quizStates = [
      QuizState(
        quizId: 1,
        category: ERecycle.paper,
      ),
      QuizState(
        quizId: 2,
        category: ERecycle.glass,
      ),
      QuizState(
        quizId: 3,
        category: ERecycle.clothing,
      ),
    ];

    return quizStates;
  }

  @override
  QuizHistoryState readQuiz(int quizId) {
    switch (quizId) {
      case 1:
        return QuizHistoryState(
          category: ERecycle.paper,
          content: '신문지는 재활용이 가능한가요?',
        );
      case 2:
        return QuizHistoryState(
          category: ERecycle.glass,
          content: '깨진 유리병은 재활용할 수 없나요?',
        );
      case 3:
        return QuizHistoryState(
          category: ERecycle.clothing,
          content: '옷을 재활용할 때는 원단의 종류를 구분하지 않아도 되나요?',
        );
      default:
        return QuizHistoryState(
          category: ERecycle.paper,
          content: '신문지는 재활용이 가능한가요?',
        );
    }
  }
}
