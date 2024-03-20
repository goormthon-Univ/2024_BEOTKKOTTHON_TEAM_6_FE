import 'package:get/get.dart';
import 'package:rebook/view_model/home/home_view_model.dart';
import 'package:rebook/view_model/load_map/load_map_view_model.dart';
import 'package:rebook/view_model/login/login_view_model.dart';
import 'package:rebook/view_model/profile/profile_view_model.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootViewModel>(() => RootViewModel());

    HomeBinding().dependencies();
    ProfileBinding().dependencies();
    LoadMapBinding().dependencies();
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }
}

class LoadMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadMapViewModel>(() => LoadMapViewModel());
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}