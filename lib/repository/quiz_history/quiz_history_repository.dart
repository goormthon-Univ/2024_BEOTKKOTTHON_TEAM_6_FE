import 'package:rebook/model/home/quiz_history_state.dart';

abstract class QuizHistoryRepository {
  Map<String, dynamic> createQuizHistory(int quizId, bool answer);
  QuizHistoryState readQuizHistory(int quizHistoryId);
}
