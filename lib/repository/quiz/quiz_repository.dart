import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/model/home/quiz_state.dart';

abstract class QuizRepository {
  List<QuizState> readRandomQuizzes();

  QuizHistoryState readQuiz(int quizId);
}
