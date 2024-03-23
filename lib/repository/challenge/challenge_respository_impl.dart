import 'package:get/get.dart';
import 'package:rebook/model/challenge_room/challenge_room_user_state.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/model/loadmap/challenge_detail_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/provider/challenge/challenge_provider.dart';
import 'package:rebook/repository/challenge/challenge_respository.dart';

class ChallengeRepositoryImpl extends GetxService
    implements ChallengeRepository {
  late final ChallengeProvider _challengeProvider;

  @override
  void onInit() {
    super.onInit();
    _challengeProvider = Get.find<ChallengeProvider>();
  }

  @override
  Future<List<ChallengeState>> readChallengeList() async {
    List<dynamic> data;
    try {
      data = await _challengeProvider.getChallengeListInformation();
    } catch (e) {
      return [];
    }
    return data.map((e) => ChallengeState.fromJson(e)).toList();
  }

  @override
  Future<ChallengeDetailState> readChallenge(int challengeId) async {
    Map<String, dynamic> data;
    try {
      data =
          await _challengeProvider.getChallengeDetailInformation(challengeId);
    } catch (e) {
      return ChallengeDetailState.initial();
    }
    return ChallengeDetailState.fromJson(data);
  }

  @override
  Future<List<ChallengeRoomUserState>> readChallengeRoomUsers(int challengeRoomId) async{
    List<dynamic> data;
    try {
      data = await _challengeProvider.getChallengeRoomUsers(challengeRoomId);
    } catch (e) {
      return [];
    }
    return data.map((e) => ChallengeRoomUserState.fromJson(e)).toList();
  }
}
