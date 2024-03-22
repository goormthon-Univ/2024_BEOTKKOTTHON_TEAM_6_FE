import 'package:get/get.dart';
import 'package:rebook/view_model/login/login_view_model.dart';
import 'package:rebook/view_model/matching/matching_view_model.dart';

class MatchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchingViewModel>(() => MatchingViewModel());
  }
}
