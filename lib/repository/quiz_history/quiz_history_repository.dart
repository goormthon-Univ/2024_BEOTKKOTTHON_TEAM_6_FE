import 'package:rebook/model/home/quiz_history_state.dart';

abstract class QuizHistoryRepository {
  Future<Map<String, dynamic>> createQuizHistory(int quizId, bool answer);
  Future<QuizHistoryState> readQuizHistory(int quizHistoryId);
  Future<List<QuizHistoryState>> readQuizHistoriesByDate(
    DateTime date,
  );
}
