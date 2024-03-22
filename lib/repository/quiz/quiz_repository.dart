import 'package:rebook/model/home/quiz_state.dart';

abstract class QuizRepository {
  List<QuizState> readRandomQuizzes();
}
