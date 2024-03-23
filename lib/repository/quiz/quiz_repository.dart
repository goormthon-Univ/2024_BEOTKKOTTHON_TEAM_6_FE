import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/model/type/e_recycle.dart';

abstract class QuizRepository {
  Future<List<QuizState>> readRandomQuizzes();

  Future<QuizHistoryState> readQuiz(int quizId);
}
