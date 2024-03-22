import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rebook/model/home/card_state.dart';
import 'package:rebook/repository/quiz/quiz_repository.dart';

class HomeViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final QuizRepository _quizRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final PageController _pageController;

  late final RxList<CardState> _cardStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  PageController get pageController => _pageController;

  List<CardState> get cardStates => _cardStates;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _quizRepository = Get.find<QuizRepository>();

    // Initialize private fields
    _pageController = PageController(viewportFraction: 0.83);

    _cardStates = [CardState(isCharacterCard: true)].obs;
  }

  @override
  void onReady() {
    super.onReady();

    _cardStates.addAll(_quizRepository
        .readRandomQuizzes()
        .map((e) => CardState(isCharacterCard: false, quizState: e)));
  }
}
