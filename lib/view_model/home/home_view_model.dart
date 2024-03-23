import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rebook/model/home/card_state.dart';
import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';
import 'package:rebook/repository/quiz_history/quiz_history_repository.dart';
import 'package:rebook/view_model/profile/profile_view_model.dart';

class HomeViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final QuizRepository _quizRepository;
  late final QuizHistoryRepository _quizHistoryRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final PageController _pageController;

  late final RxBool _isLoadingWhenOpenDialog;
  late final RxList<Rx<CardState>> _cardStates;
  late final Rx<QuizHistoryState> _quizDetailState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  PageController get pageController => _pageController;

  bool get isLoadingWhenOpenDialog => _isLoadingWhenOpenDialog.value;
  RxList<Rx<CardState>> get cardStates => _cardStates;
  CardState getCardState(int index) => _cardStates[index].value;
  QuizHistoryState get quizDetailState => _quizDetailState.value;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _quizRepository = Get.find<QuizRepository>();
    _quizHistoryRepository = Get.find<QuizHistoryRepository>();

    // Initialize private fields
    _pageController = PageController(viewportFraction: 0.83);

    _cardStates = [CardState(isCharacterCard: true).obs].obs;
    _quizDetailState = QuizHistoryState.initial().obs;
    _isLoadingWhenOpenDialog = false.obs;
  }

  @override
  void onReady() async {
    super.onReady();

    _cardStates.addAll((await _quizRepository.readRandomQuizzes())
        .map((e) => CardState(isCharacterCard: false, quizState: e).obs));
  }

  void fetchQuizDetail(int index) async {
    CardState cardState = _cardStates[index].value;
    QuizState quizState = cardState.quizState!;

    _isLoadingWhenOpenDialog.value = true;

    if (quizState.quizHistoryId != null) {
      _quizDetailState.value = await _quizHistoryRepository.readQuizHistory(
        quizState.quizHistoryId!,
      );
    } else {
      _quizDetailState.value = await _quizRepository.readQuiz(
        quizState.quizId,
      );
    }

    _isLoadingWhenOpenDialog.value = false;
  }

  void changeQuizStateInDialog(int index, bool userAnswer) async {
    CardState cardState = _cardStates[index].value;
    QuizState quizState = cardState.quizState!;

    Map<String, dynamic> result =
        await _quizHistoryRepository.createQuizHistory(
      quizState.quizId,
      userAnswer,
    );

    _cardStates[index] = cardState
        .copyWith(
          quizState: quizState.copyWith(
            quizHistoryId: result['id'] as int,
            isChanged: true,
          ),
        )
        .obs;

    _quizDetailState.value = _quizDetailState.value.copyWith(
      userAnswer: userAnswer,
      validAnswer: userAnswer == result['validAnswer'],
    );

    Get.find<ProfileViewModel>().fetchQuizHistoriesOuter();
  }

  void changeQuizStateInScreen(int index) {
    CardState cardState = _cardStates[index].value;
    QuizState quizState = cardState.quizState!;

    _cardStates[index] = cardState
        .copyWith(
          quizState: quizState.copyWith(
            isChanged: false,
          ),
        )
        .obs;
  }
}
