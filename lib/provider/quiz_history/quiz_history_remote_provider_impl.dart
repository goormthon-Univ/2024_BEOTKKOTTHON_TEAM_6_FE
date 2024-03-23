import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rebook/provider/base/base_connect.dart';
import 'package:rebook/provider/quiz_history/quiz_history_remote_provider.dart';

class QuizHistoryRemoteProviderImpl extends BaseConnect
    implements QuizHistoryRemoteProvider {
  @override
  Future<Map<String, dynamic>> getQuizHistory(int quizHistoryId) async {
    Response response;

    try {
      response = await get(
        '/api/v1/quiz-histories/$quizHistoryId',
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<Map<String, dynamic>> postQuizHistory(int quizId, bool answer) async {
    Response response;

    try {
      response = await post(
        '/api/v1/quiz-histories',
        {
          'quizId': quizId,
          'answer': answer,
        },
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<List<dynamic>> getQuizHistoriesByDate(DateTime date) async {
    Response response;

    try {
      response = await get(
        '/api/v1/users/quiz-histories',
        query: {
          'whichDate': DateFormat('yyyy-MM-dd').format(date),
        },
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }
}
