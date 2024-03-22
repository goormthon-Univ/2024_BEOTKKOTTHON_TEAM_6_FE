import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:rebook/repository/user_repository.dart';
import 'package:rebook/utility/functions/log_util.dart';

import '../../repository/auth/auth_repository.dart';

class LoginViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final AuthRepository _authRepository;
  late final UserRepository _userRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isEnableGreyBarrier;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _authRepository = Get.find<AuthRepository>();
    _userRepository = Get.find<UserRepository>();

    // Initialize Private Fields
    _isEnableGreyBarrier = false.obs;
  }

  Future<bool> kakaoSignInAccount() async {
    String kakaoAccessToken;

    try {
      OAuthToken token;
      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }
      kakaoAccessToken = token.accessToken;
    } catch (_) {
      return false; // 로그인 실패
    }
    LogUtil.info('Kakao Access Token: $kakaoAccessToken');
    _isEnableGreyBarrier.value = true;

    bool result =
        await _authRepository.loginWithKakaoAccessToken(kakaoAccessToken);

    _isEnableGreyBarrier.value = false;
    return result;
  }
}
