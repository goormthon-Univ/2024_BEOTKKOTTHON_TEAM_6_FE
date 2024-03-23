import 'package:get/get.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/model/loadmap/challlenge_detail_state.dart';
import 'package:rebook/provider/base/base_connect.dart';
import 'package:rebook/provider/challenge/challenge_provider.dart';

class ChallengeProviderImpl extends BaseConnect implements ChallengeProvider {
  @override
  Future<List<dynamic>> getChallengeListInformation() async {
    final Response response;

    try {
      response = await get('/api/v1/users/challenges');
    } catch (e) {
      rethrow;
    }
    if (response.body['success'] == true && response.body['data'] != null) {
      List<dynamic> dataList = response.body['data'];
      List<ChallengeState> challenges = dataList.map((data) => ChallengeState.fromJson(data)).toList();
      return challenges;
    } else {
      throw Exception('Failed to load challenge list'); // 데이터 로딩 실패 시 예외 발생
    }
  }



  @override
  Future<Map<String, dynamic>> getChallengeDetailInformation(
      int challengeId) async {
    final Response response;

    try {
      response = await get('/api/v1/challenges/$challengeId');
    } catch (e) {
      rethrow;
    }
    Future<Map<String, dynamic>> data = response.body['data'];
    return data;
  }
}
