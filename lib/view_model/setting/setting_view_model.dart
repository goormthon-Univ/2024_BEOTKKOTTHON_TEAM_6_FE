import 'package:get/get.dart';
import 'package:rebook/repository/auth/auth_repository.dart';
import 'package:rebook/repository/user/user_repository.dart';

class SettingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final AuthRepository _authRepository;

  @override
  void onInit() {
    super.onInit();
    // DI Fields
    _authRepository = Get.find<AuthRepository>();
  }

  Future<void> logout() async {
    await _authRepository.clearTokens();
  }

  Future<void> withdrawal() async {
    await _authRepository.clearTokens();
  }
}
