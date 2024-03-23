abstract class QuizHistoryRemoteProvider {
  Future<Map<String, dynamic>> postQuizHistory(int quizId, bool answer);
  Future<Map<String, dynamic>> getQuizHistory(int quizHistoryId);
  Future<List<dynamic>> getQuizHistoriesByDate(DateTime date);
}
