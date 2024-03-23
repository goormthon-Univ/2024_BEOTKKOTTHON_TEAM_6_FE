abstract class QuizRemoteProvider {
  Future<List<dynamic>> getRandomQuizzes();
  Future<Map<String, dynamic>> getQuiz(int quizId);
}
