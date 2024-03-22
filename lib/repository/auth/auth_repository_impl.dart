import 'package:get/get.dart';
import 'package:rebook/app/factory/secure_storage_factory.dart';
import 'package:rebook/provider/auth/auth_provider.dart';
import 'package:rebook/provider/user/token_provider.dart';
import 'package:rebook/repository/auth/auth_repository.dart';

class AuthRepositoryImpl extends GetxService implements AuthRepository {
  late final AuthProvider _authProvider;
  late final TokenProvider _tokenProvider;

  @override
  void onInit() {
    super.onInit();

    _authProvider = Get.find<AuthProvider>();
    _tokenProvider = SecureStorageFactory.tokenProvider;
  }

  @override
  Future<bool> loginWithKakaoAccessToken(String accessToken) async {
    Map<String, dynamic> data;

    try {
      data = await _authProvider.loginWithKakaoAccessToken(accessToken);
    } catch (e) {
      return false;
    }

    await _tokenProvider.setAccessToken(data['accessToken']);
    await _tokenProvider.setRefreshToken(data['refreshToken']);

    return true;
  }
}
