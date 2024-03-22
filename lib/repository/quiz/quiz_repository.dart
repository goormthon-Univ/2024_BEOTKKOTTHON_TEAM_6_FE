import 'package:rebook/model/home/quiz_detail_state.dart';
import 'package:rebook/model/home/quiz_state.dart';

abstract class QuizRepository {
  List<QuizState> readRandomQuizzes();

  QuizDetailState readQuiz(int quizId);
}
