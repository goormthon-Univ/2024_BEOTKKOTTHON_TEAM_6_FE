import 'package:get/get.dart';
import 'package:rebook/model/loadmap/challenge_state.dart';
import 'package:rebook/model/loadmap/challlenge_detail_state.dart';
import 'package:rebook/repository/challenge/challenge_respository.dart';

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
    ///
    _challengeStates = [ChallengeState(id: 1).obs].obs;
    _challengeDetailState = ChallengeDetailState.initial().obs;
  }

  @override
  void onReady() {
    super.onReady();

    _challengeStates.addAll(_challengeRepository.readChallengeList());

  }

  // @override
  // void onReady() {
  //   super.onReady();
  //
  //   _cardStates.addAll(_quizRepository
  //       .readRandomQuizzes()
  //       .map((e) => CardState(isCharacterCard: false, quizState: e).obs));
  // }


  // @override
  // void onInit() {
  //   super.onInit();
  //   // Dependency Injection
  //   _quizRepository = Get.find<QuizRepository>();
  //   _quizHistoryRepository = Get.find<QuizHistoryRepository>();
  //
  //   // Initialize private fields
  //   _pageController = PageController(viewportFraction: 0.83);
  //
  //   _cardStates = [CardState(isCharacterCard: true).obs].obs;
  //   _quizDetailState = QuizDetailState.initial().obs;
  //   _isLoadingWhenOpenDialog = false.obs;
  // }


}
