import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:rebook/repository/user_repository.dart';

class LoginViewModel extends GetxController {
  late final UserRepository _userRepository;

  // 공통 UI 상태 관리를 위한 RxBool 변수
  late final RxBool _isEnableGreyBarrier;
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  LoginViewModel() {
    _userRepository = Get.find<UserRepository>();
    _isEnableGreyBarrier = false.obs; // 초기 UI 상태 설정
  }

  Future<bool> kakaoSignInAccount() async {
    _isEnableGreyBarrier.value = true;
    try {
      OAuthToken token;
      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }
      // AccessToken 출력
      print('카카오 로그인 성공: AccessToken: ${token.accessToken}');
      // 여기서 받은 토큰으로 우리 서버에 로그인 api 호출

      _isEnableGreyBarrier.value = false;
      return true; // 로그인 성공
    } catch (error) {
      String errorMessage = "카카오 로그인 실패";
      if (error is KakaoAuthException) {
        errorMessage += ": 인증 에러";
      } else if (error is KakaoClientException) {
        errorMessage += ": 클라이언트 에러";
      } else if (error is PlatformException && error.code == 'CANCELED') {
        errorMessage = "카카오 로그인 취소";
      } else if (error is Exception) {
        errorMessage += ": 예외 발생";
      }
      print(errorMessage);

      _isEnableGreyBarrier.value = false;
      return false; // 로그인 실패
    }
  }

}