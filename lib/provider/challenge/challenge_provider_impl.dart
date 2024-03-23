import 'package:get/get.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/model/loadmap/challenge_detail_state.dart';
import 'package:rebook/provider/base/base_connect.dart';
import 'package:rebook/provider/challenge/challenge_provider.dart';

class ChallengeProviderImpl extends BaseConnect implements ChallengeProvider {
  @override
  Future<List<dynamic>> getChallengeListInformation() async {
    Response response;

    try {
      response = await get('/api/v1/users/challenges');
    } catch (e) {
      rethrow;
    }
    return response.body['data'];
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
    return response.body['data'];
  }

  @override
  Future<List> getChallengeRoomUsers(int challengeRoomId) async {
    final Response response;

    try {
      response = await get('/api/v1/challenge-rooms/$challengeRoomId/users');
    } catch (e) {
      rethrow;
    }
    return response.body['data'];
  }
}
