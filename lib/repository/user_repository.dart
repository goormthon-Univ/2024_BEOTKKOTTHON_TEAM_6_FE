import 'package:get/get.dart';
import 'package:rebook/model/root/user_state.dart';
import 'package:rebook/provider/user/user_remote_provider.dart';

class UserRepository extends GetxService {
  late final UserRemoteProvider _userRemoteProvider;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _userRemoteProvider = Get.find<UserRemoteProvider>();
  }

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
