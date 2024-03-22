import 'package:get/get.dart';
import 'package:rebook/view_model/login/login_view_model.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}
