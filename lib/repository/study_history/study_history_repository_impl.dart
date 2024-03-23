import 'package:get/get.dart';
import 'package:rebook/model/study_history/study_history_detail_state.dart';
import 'package:rebook/model/study_history/study_history_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/provider/study_history/study_history_remote_provider.dart';
import 'package:rebook/repository/study_history/study_history_repository.dart';

class StudyHistoryRepositoryImpl extends GetxService
    implements StudyHistoryRepository {
  late final StudyHistoryRemoteProvider _studyHistoryRemoteProvider;

  @override
  void onInit() {
    super.onInit();

    _studyHistoryRemoteProvider = Get.find<StudyHistoryRemoteProvider>();
  }

  @override
  Future<List<StudyHistoryState>> readStudyHistoryByCategoryAndIsMarking(
    ERecycle category,
    bool? isMarking,
    int page,
    int size,
  ) async {
    List<dynamic> data;

    try {
      data = await _studyHistoryRemoteProvider
          .getStudyHistoriesByCategoryAndIsMarking(
        category,
        isMarking,
        page,
        size,
      );
    } catch (e) {
      rethrow;
    }

    return data.map((e) => StudyHistoryState.fromJson(e)).toList();
  }

  @override
  Future<StudyHistoryDetailState> readStudyHistory(int id) async {
    Map<String, dynamic> data;

    try {
      data = await _studyHistoryRemoteProvider.getStudyHistory(id);
    } catch (e) {
      rethrow;
    }

    return StudyHistoryDetailState.fromJson(data);
  }

  @override
  Future<bool> updateIsMarkingInStudyHistory(int id, bool isMarking) async {
    try {
      await _studyHistoryRemoteProvider.patchIsMarkingInStudyHistory(
          id, isMarking);
    } catch (e) {
      rethrow;
    }

    return true;
  }
}
