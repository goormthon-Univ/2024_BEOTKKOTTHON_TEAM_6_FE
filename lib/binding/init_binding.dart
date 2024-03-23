import 'package:get/get.dart';
import 'package:rebook/provider/auth/auth_provider.dart';
import 'package:rebook/provider/auth/auth_provider_impl.dart';
import 'package:rebook/provider/quiz/quiz_remote_provider.dart';
import 'package:rebook/provider/quiz/quiz_remote_provider_impl.dart';
import 'package:rebook/provider/quiz_history/quiz_history_remote_provider.dart';
import 'package:rebook/provider/quiz_history/quiz_history_remote_provider_impl.dart';
import 'package:rebook/provider/study_history/study_history_remote_provider.dart';
import 'package:rebook/provider/study_history/study_history_remote_provider_impl.dart';
import 'package:rebook/provider/user/user_remote_provider.dart';
import 'package:rebook/provider/user/user_remote_provider_impl.dart';
import 'package:rebook/repository/auth/auth_repository.dart';
import 'package:rebook/repository/auth/auth_repository_impl.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';
import 'package:rebook/repository/quiz/quiz_repository_impl.dart';
import 'package:rebook/repository/quiz_history/quiz_history_repository.dart';
import 'package:rebook/repository/quiz_history/quiz_history_repository_impl.dart';
import 'package:rebook/repository/study_history/study_history_repository.dart';
import 'package:rebook/repository/study_history/study_history_repository_impl.dart';
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
    Get.lazyPut<QuizRemoteProvider>(() => QuizRemoteProviderImpl());
    Get.lazyPut<QuizHistoryRemoteProvider>(
      () => QuizHistoryRemoteProviderImpl(),
    );
    Get.lazyPut<StudyHistoryRemoteProvider>(
      () => StudyHistoryRemoteProviderImpl(),
    );

    // Repositories
    Get.putAsync<AuthRepository>(
      () async => AuthRepositoryImpl(),
    );

    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut<QuizRepository>(() => QuizRepositoryImpl());
    Get.lazyPut<QuizHistoryRepository>(() => QuizHistoryRepositoryImpl());
    Get.lazyPut<StudyHistoryRepository>(() => StudyHistoryRepositoryImpl());
  }
}
