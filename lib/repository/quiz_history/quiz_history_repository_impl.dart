import 'package:get/get.dart';
import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/provider/quiz_history/quiz_history_remote_provider.dart';
import 'package:rebook/repository/quiz_history/quiz_history_repository.dart';

class QuizHistoryRepositoryImpl extends GetxService
    implements QuizHistoryRepository {
  late final QuizHistoryRemoteProvider _quizHistoryRemoteProvider;

  @override
  void onInit() {
    super.onInit();

    _quizHistoryRemoteProvider = Get.find<QuizHistoryRemoteProvider>();
  }

  @override
  Future<Map<String, dynamic>> createQuizHistory(
    int quizId,
    bool answer,
  ) async {
    Map<String, dynamic> data;

    try {
      data = await _quizHistoryRemoteProvider.postQuizHistory(quizId, answer);
    } catch (e) {
      return {};
    }

    return data;
  }

  @override
  Future<QuizHistoryState> readQuizHistory(int quizHistoryId) async {
    Map<String, dynamic> data;

    try {
      data = await _quizHistoryRemoteProvider.getQuizHistory(quizHistoryId);
    } catch (e) {
      return QuizHistoryState.initial();
    }

    return QuizHistoryState.fromJson(data);
  }
}
