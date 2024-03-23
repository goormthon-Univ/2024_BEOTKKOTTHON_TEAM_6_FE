import 'package:get/get.dart';
import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/provider/quiz/quiz_remote_provider.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';

class QuizRepositoryImpl extends GetxService implements QuizRepository {
  late final QuizRemoteProvider _quizRemoteProvider;

  @override
  void onInit() {
    super.onInit();
    _quizRemoteProvider = Get.find<QuizRemoteProvider>();
  }

  @override
  Future<List<QuizState>> readRandomQuizzes() async {
    List<dynamic> data;

    try {
      data = await _quizRemoteProvider.getRandomQuizzes();
    } catch (e) {
      return [];
    }

    return data.map((e) => QuizState.fromJson(e)).toList();
  }

  @override
  Future<QuizHistoryState> readQuiz(int quizId) async {
    Map<String, dynamic> data;
    try {
      data = await _quizRemoteProvider.getQuiz(quizId);
    } catch (e) {
      return QuizHistoryState.initial();
    }

    return QuizHistoryState.fromJson(data);
  }
}
