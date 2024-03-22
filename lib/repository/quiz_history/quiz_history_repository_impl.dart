import 'package:rebook/model/home/quiz_detail_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/repository/quiz_history/quiz_history_repository.dart';

class QuizHistoryRepositoryImpl implements QuizHistoryRepository {
  @override
  Map<String, dynamic> createQuizHistory(int quizId, bool answer) {
    return {
      'quizHistoryId': 1,
      'result': answer,
    };
  }

  @override
  QuizDetailState readQuizHistory(int quizHistoryId) {
    return QuizDetailState(
      category: ERecycle.paper,
      content: 'This is a quiz history',
      result: true,
    );
  }
}
