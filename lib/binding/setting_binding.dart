import 'package:get/get.dart';
import 'package:rebook/view_model/setting/setting_view_model.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingViewModel>(() => SettingViewModel());
  }
}
