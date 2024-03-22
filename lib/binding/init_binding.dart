import 'package:get/get.dart';
import 'package:rebook/provider/auth/auth_provider.dart';
import 'package:rebook/provider/auth/auth_provider_impl.dart';
import 'package:rebook/provider/user/user_remote_provider.dart';
import 'package:rebook/provider/user/user_remote_provider_impl.dart';
import 'package:rebook/repository/auth/auth_repository.dart';
import 'package:rebook/repository/auth/auth_repository_impl.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';
import 'package:rebook/repository/quiz/quiz_repository_impl.dart';
import 'package:rebook/repository/user/user_repository.dart';
import 'package:rebook/repository/user/user_repository_impl.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Providers
    Get.putAsync<AuthProvider>(
      () async => AuthProviderImpl(),
    );
    Get.lazyPut<UserRemoteProvider>(() => UserRemoteProviderImpl());

    // Repositories
    Get.putAsync<AuthRepository>(
      () async => AuthRepositoryImpl(),
    );

    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut<QuizRepository>(() => QuizRepositoryImpl());
  }
}
