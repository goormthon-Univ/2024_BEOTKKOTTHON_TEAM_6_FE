import 'package:get/get.dart';
import 'package:rebook/view_model/study_history/study_history_view_model.dart';

class StudyHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudyHistoryViewModel>(() => StudyHistoryViewModel());
  }
}
