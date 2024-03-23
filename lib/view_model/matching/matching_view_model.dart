import 'package:get/get.dart';
import 'package:rebook/model/challenge_room/challenge_room_user_state.dart';
import 'package:rebook/repository/challenge/challenge_respository.dart';

class MatchingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ChallengeRepository _challengeRepository;
  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */

  late final RxBool _isLoadingWhenOpenDialog;
  late final RxList<Rx<ChallengeRoomUserState>> _challengeRoomUserStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isLoadingWhenOpenDialog => _isLoadingWhenOpenDialog.value;
  RxList<Rx<ChallengeRoomUserState>> get challengeStates =>
      _challengeRoomUserStates;
  ChallengeRoomUserState getChallengeRoomState(int index) =>
      _challengeRoomUserStates[index].value;

  void updateUsers(List<ChallengeRoomUserState> users) {
    _challengeRoomUserStates.value = users.map((user) => user.obs).toList();
  }

  @override
  void onInit() {
    super.onInit();
    _challengeRoomUserStates = RxList<Rx<ChallengeRoomUserState>>.from([
      ChallengeRoomUserState(
          userId: "1",
          userNickname: "사용자1",
          studyHistories: [
            StudyHistories(id: 1, category: 'paper'),
            StudyHistories(id: 2, category: 'can'),
            StudyHistories(id: 3, category: 'plastic')
          ]).obs,
      ChallengeRoomUserState(
          userId: "2",
          userNickname: "사용자2",
          studyHistories: [
            StudyHistories(id: 1, category: 'paper'),
            StudyHistories(id: 2, category: 'can'),
            StudyHistories(id: 3, category: 'plastic')
          ]).obs,
      ChallengeRoomUserState(
          userId: "3",
          userNickname: "사용자3",
          studyHistories: [
            StudyHistories(id: 1, category: 'paper'),
            StudyHistories(id: 2, category: 'can'),
            StudyHistories(id: 3, category: 'plastic')
          ]).obs,
      ChallengeRoomUserState(
          userId: "4",
          userNickname: "사용자4",
          studyHistories: [
            StudyHistories(id: 1, category: 'paper'),
            StudyHistories(id: 2, category: 'can'),
            StudyHistories(id: 3, category: 'plastic')
          ]).obs,
    ]);

    _isLoadingWhenOpenDialog = false.obs;
  }
}
