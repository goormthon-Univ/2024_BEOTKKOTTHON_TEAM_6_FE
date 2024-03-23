import 'package:get/get.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/provider/base/base_connect.dart';
import 'package:rebook/provider/study_history/study_history_remote_provider.dart';

class StudyHistoryRemoteProviderImpl extends BaseConnect
    implements StudyHistoryRemoteProvider {
  @override
  Future<List<dynamic>> getStudyHistoriesByCategoryAndIsMarking(
    ERecycle category,
    bool? isMarking,
    int page,
    int size,
  ) async {
    Response response;

    try {
      Map<String, String> query = {
        'category': category.en,
        'page': page.toString(),
        'size': size.toString(),
      };

      if (isMarking != null) {
        query['isMarking'] = isMarking.toString();
      }
      response = await get(
        '/api/v1/study-histories',
        query: query,
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<Map<String, dynamic>> getStudyHistory(int id) async {
    Response response;

    try {
      response = await get('/api/v1/study-histories/$id');
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }

  @override
  Future<bool> patchIsMarkingInStudyHistory(int id, bool isMarking) async {
    return Future.value(true);
  }
}
