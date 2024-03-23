import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/app/factory/secure_storage_factory.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/model/loadmap/challenge_detail_state.dart';
import 'package:rebook/provider/token/token_provider.dart';
import 'package:rebook/repository/challenge/challenge_respository.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/view/load_map/widget/ongoing_animated_challenge.dart';
import 'package:rebook/widget/dialog/challenge_dialog.dart';

class LoadMapViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ChallengeRepository _challengeRepository;
  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */


  late final RxBool _isLoadingWhenOpenDialog;
  late final RxList<Rx<ChallengeState>> _challengeStates;
  late final Rx<ChallengeDetailState> _challengeDetailState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isLoadingWhenOpenDialog => _isLoadingWhenOpenDialog.value;
  RxList<Rx<ChallengeState>> get challengeStates => _challengeStates;
  ChallengeState getChallengeState(int index) => _challengeStates[index].value;
  ChallengeDetailState get challengeDetailState => _challengeDetailState.value;


  @override
  void onInit() {
    super.onInit();
    _challengeRepository = Get.find<ChallengeRepository>();
    _challengeStates = [ChallengeState(id: 0).obs].obs;
    _challengeDetailState = ChallengeDetailState.initial().obs;
    _isLoadingWhenOpenDialog = false.obs;
  }

  @override
  void onReady() async {
    super.onReady();
    final challenges = await _challengeRepository.readChallengeList();

    _challengeStates.clear();

    _challengeStates.addAll(
      challenges.map((challenge) => ChallengeState(
        id: challenge.id,
        roomId: challenge.roomId,
        isCurrentParticipate: challenge.isCurrentParticipate,
      ).obs),
    );
  }


  Future<int> fetchChallengeDetail(int challengeId) async {
    _isLoadingWhenOpenDialog.value = true;
    try {
      final detail = await _challengeRepository.readChallenge(challengeId);
      _challengeDetailState.value = detail;
      final socketPossible = _challengeDetailState.value.canParticipate;
      Get.dialog(ChallengeDialog(
        challengeDetail: detail,
        challengeId: challengeId,
      ));
      if (socketPossible) {
        return challengeId.toInt();
      } else {
        return -1;
      }
    } catch (e) {
      /// 오류 처리
      LogUtil.error(e);
      rethrow;
    } finally {
      _isLoadingWhenOpenDialog.value = false;
    }
  }
}
