import 'package:rebook/model/study_history/study_history_detail_state.dart';
import 'package:rebook/model/study_history/study_history_state.dart';
import 'package:rebook/model/type/e_recycle.dart';

abstract class StudyHistoryRepository {
  Future<List<StudyHistoryState>> readStudyHistoryByCategoryAndIsMarking(
    ERecycle category,
    bool? isMarking,
    int page,
    int size,
  );

  Future<StudyHistoryDetailState> readStudyHistory(int id);

  Future<bool> updateIsMarkingInStudyHistory(int id, bool isMarking);
}
