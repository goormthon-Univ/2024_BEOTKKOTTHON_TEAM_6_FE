import 'package:get/get.dart';
import 'package:rebook/view_model/challenge_authentication/challenge_authentication_view_model.dart';

class ChallengeAuthenticationBinding extends Bindings {
  // Get.lazyPut을 통해 ViewModel 인스턴스가 실제로 필요할 때까지 생성을 지연시키며, 리소스 사용 최적화에 도움
  @override
  void dependencies() {
    Get.lazyPut<ChallengeAuthenticationViewModel>(
            () => ChallengeAuthenticationViewModel());
  }
}
