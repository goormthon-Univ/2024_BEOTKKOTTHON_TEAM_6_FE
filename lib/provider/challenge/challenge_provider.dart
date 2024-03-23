import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/model/loadmap/challlenge_detail_state.dart';

abstract class ChallengeProvider {
  Future<List<dynamic>> getChallengeListInformation();
  Future<Map<String, dynamic>> getChallengeDetailInformation(int challengeId);
}
