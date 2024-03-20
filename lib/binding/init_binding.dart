import 'package:get/get.dart';
import 'package:rebook/repository/user_repository.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Providers

    // Repositories
    Get.putAsync<UserRepository>(
          () async => UserRepository(),
    );
  }
}
