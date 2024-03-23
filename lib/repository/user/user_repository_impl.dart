import 'package:get/get.dart';
import 'package:rebook/model/root/user_state.dart';
import 'package:rebook/provider/user/user_remote_provider.dart';
import 'package:rebook/repository/user/user_repository.dart';

class UserRepositoryImpl extends GetxService implements UserRepository {
  late final UserRemoteProvider _userRemoteProvider;

  @override
  void onInit() {
    super.onInit();
    _userRemoteProvider = Get.find<UserRemoteProvider>();
  }

  @override
  Future<UserState> readUserState() async {
    Map<String, dynamic> data;

    try {
      data = await _userRemoteProvider.getUserInformation();
    } catch (e) {
      return UserState.initial();
    }

    return UserState.fromJson(data);
  }
}
