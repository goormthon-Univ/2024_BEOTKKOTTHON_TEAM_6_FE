import 'package:get/get.dart';
import 'package:rebook/view_model/study_by_image/study_by_image_view_model.dart';

class StudyByImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudyByImageViewModel>(() => StudyByImageViewModel());
  }
}
