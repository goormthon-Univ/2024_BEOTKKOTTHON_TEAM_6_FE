import 'package:rebook/model/home/quiz_history_state.dart';
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
  QuizHistoryState readQuizHistory(int quizHistoryId) {
    return QuizHistoryState(
      category: ERecycle.paper,
      content: '신문지는 재활용이 가능한가요?',
      userAnswer: true,
      validAnswer: false,
    );
  }
}
