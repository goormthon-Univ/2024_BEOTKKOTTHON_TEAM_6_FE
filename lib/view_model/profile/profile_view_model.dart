import 'package:get/get.dart';
import 'package:rebook/model/home/quiz_history_state.dart';
import 'package:rebook/model/profile/calender_state.dart';
import 'package:rebook/model/profile/profile_card_state.dart';
import 'package:rebook/repository/quiz_history/quiz_history_repository.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final QuizHistoryRepository _quizHistoryRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<CalendarState> _calendarState;
  late final RxList<ProfileCardState> _profileCardStates;

  late final RxBool _isLoadingWhenOpenDialog;
  late final Rx<QuizHistoryState> _quizHistoryState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  CalendarState get calendarState => _calendarState.value;
  List<ProfileCardState> get profileCardStates => _profileCardStates;
  bool get isLoadingWhenOpenDialog => _isLoadingWhenOpenDialog.value;
  QuizHistoryState get quizHistoryState => _quizHistoryState.value;

  @override
  void onInit() {
    super.onInit();
    _quizHistoryRepository = Get.find<QuizHistoryRepository>();

    // Initialize private fields
    _calendarState = CalendarState.initial().obs;
    _profileCardStates = [ProfileCardState(isEnvCard: true)].obs;

    _isLoadingWhenOpenDialog = false.obs;
    _quizHistoryState = QuizHistoryState.initial().obs;

    fetchQuizHistories();
  }

  void fetchQuizHistories() async {
    _profileCardStates.removeRange(1, _profileCardStates.length);

    final quizHistories = await _quizHistoryRepository
        .readQuizHistoriesByDate(_calendarState.value.selectedDate);
    for (var quizHistory in quizHistories) {
      _profileCardStates.add(
        ProfileCardState(
          isEnvCard: false,
          quizHistoryState: quizHistory,
        ),
      );
    }
  }

  void fetchQuizHistoryDetail(int index) async {
    final quizHistoryState = _profileCardStates[index].quizHistoryState!;

    _isLoadingWhenOpenDialog.value = true;

    _quizHistoryState.value = await _quizHistoryRepository.readQuizHistory(
      quizHistoryState.id!,
    );

    _isLoadingWhenOpenDialog.value = false;
  }

  void updateFocusedDate(DateTime focusedDay) {
    _calendarState.value = _calendarState.value.copyWith(
      focusedDate: focusedDay,
    );
  }

  void changeSelectedDate(DateTime selectedDate) {
    if (!isSameDay(selectedDate, _calendarState.value.selectedDate)) {
      _calendarState.value = _calendarState.value.copyWith(
        selectedDate: selectedDate,
        focusedDate: selectedDate,
      );
    }

    fetchQuizHistories();
  }
}
