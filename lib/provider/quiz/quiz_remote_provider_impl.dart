import 'package:get/get.dart';
import 'package:rebook/provider/base/base_connect.dart';
import 'package:rebook/provider/quiz/quiz_remote_provider.dart';

class QuizRemoteProviderImpl extends BaseConnect implements QuizRemoteProvider {
  @override
  Future<List<dynamic>> getRandomQuizzes() async {
    Response response;

    try {
      response = await get(
        '/api/v1/quizzes',
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<Map<String, dynamic>> getQuiz(int quizId) async {
    Response response;

    try {
      response = await get(
        '/api/v1/quizzes/$quizId',
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }
}
