import 'package:rebook/model/home/quiz_detail_state.dart';

abstract class QuizHistoryRepository {
  Map<String, dynamic> createQuizHistory(int quizId, bool answer);
  QuizDetailState readQuizHistory(int quizHistoryId);
}
