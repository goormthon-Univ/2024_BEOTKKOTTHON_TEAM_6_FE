import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rebook/model/home/card_state.dart';
import 'package:rebook/model/home/quiz_detail_state.dart';
import 'package:rebook/model/home/quiz_state.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';
import 'package:rebook/repository/quiz_history/quiz_history_repository.dart';

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
  late final Rx<QuizDetailState> _quizDetailState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  PageController get pageController => _pageController;

  bool get isLoadingWhenOpenDialog => _isLoadingWhenOpenDialog.value;
  RxList<Rx<CardState>> get cardStates => _cardStates;
  CardState getCardState(int index) => _cardStates[index].value;
  QuizDetailState get quizDetailState => _quizDetailState.value;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _quizRepository = Get.find<QuizRepository>();
    _quizHistoryRepository = Get.find<QuizHistoryRepository>();

    // Initialize private fields
    _pageController = PageController(viewportFraction: 0.83);

    _cardStates = [CardState(isCharacterCard: true).obs].obs;
    _quizDetailState = QuizDetailState.initial().obs;
    _isLoadingWhenOpenDialog = false.obs;
  }

  @override
  void onReady() {
    super.onReady();

    _cardStates.addAll(_quizRepository
        .readRandomQuizzes()
        .map((e) => CardState(isCharacterCard: false, quizState: e).obs));
  }

  void fetchQuizDetail(int index) async {
    CardState cardState = _cardStates[index].value;
    QuizState quizState = cardState.quizState!;

    _isLoadingWhenOpenDialog.value = true;

    await Future.delayed(const Duration(seconds: 2));
    if (quizState.quizHistoryId != null) {
      _quizDetailState.value =
          _quizHistoryRepository.readQuizHistory(quizState.quizHistoryId!);
    } else {
      _quizDetailState.value = _quizRepository.readQuiz(quizState.quizId);
    }

    _isLoadingWhenOpenDialog.value = false;
  }

  void changeQuizStateInDialog(int index, bool choice) async {
    CardState cardState = _cardStates[index].value;
    QuizState quizState = cardState.quizState!;

    await Future.delayed(const Duration(milliseconds: 100));
    Map<String, dynamic> result = _quizHistoryRepository.createQuizHistory(
      quizState.quizId,
      choice,
    );

    _cardStates[index] = cardState
        .copyWith(
          quizState: quizState.copyWith(
            quizHistoryId: result['quizHistoryId'] as int,
            isChanged: true,
          ),
        )
        .obs;

    _quizDetailState.value = _quizDetailState.value.copyWith(
      result: result['result'] as bool,
    );
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
