import 'package:rebook/model/type/e_recycle.dart';

abstract class StudyHistoryRemoteProvider {
  Future<List<dynamic>> getStudyHistoriesByCategoryAndIsMarking(
    ERecycle category,
    bool? isMarking,
    int page,
    int size,
  );

  Future<Map<String, dynamic>> getStudyHistory(int id);

  Future<bool> patchIsMarkingInStudyHistory(int id, bool isMarking);
}
