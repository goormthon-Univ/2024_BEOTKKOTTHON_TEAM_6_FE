import 'package:get/get.dart';
import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/model/loadmap/challlenge_detail_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/provider/challenge/challenge_provider.dart';
import 'package:rebook/repository/challenge/challenge_respository.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';

class ChallengeRepositoryImpl extends GetxService implements ChallengeRepository {
  late final ChallengeProvider _challengeProvider;

  @override
  void onInit() {
    super.onInit();
    _challengeProvider = Get.find<ChallengeProvider>();
  }





  @override
  Future<List<ChallengeState>> readChallengeList() async{
    List<ChallengeState>
  }

  @override
  Future<ChallengeDetailState> readChallenge(int challengeId) async {
    Map<String, dynamic>  data;
    try {
      data = await _challengeProvider.getChallengeDetailInformation(challengeId);
    } catch (e) {
      return ChallengeDetailState.initial();
    }
    return ChallengeDetailState.fromJson(data);
  }
}