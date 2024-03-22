import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  @override
  List<QuizState> readRandomQuizzes() {
    List<QuizState> quizStates = [
      QuizState(
        id: 1,
        category: ERecycle.paper,
      ),
      QuizState(
        id: 2,
        category: ERecycle.glass,
      ),
      QuizState(
        id: 3,
        category: ERecycle.clothing,
      ),
    ];

    return quizStates;
  }
}
