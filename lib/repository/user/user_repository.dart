import 'package:get/get.dart';
import 'package:rebook/model/root/user_state.dart';
import 'package:rebook/provider/user/user_remote_provider.dart';

abstract class UserRepository {
  Future<UserState> readUserState();
}
