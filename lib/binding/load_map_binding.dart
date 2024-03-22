import 'package:get/get.dart';
import 'package:rebook/view_model/load_map/load_map_view_model.dart';

class LoadMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadMapViewModel>(() => LoadMapViewModel());
  }
}
