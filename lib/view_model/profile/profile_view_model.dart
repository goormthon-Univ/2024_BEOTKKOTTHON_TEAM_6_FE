import 'package:get/get.dart';
import 'package:rebook/model/profile/calender_state.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<CalendarState> _calendarState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  CalendarState get calendarState => _calendarState.value;

  @override
  void onInit() {
    super.onInit();

    // Initialize private fields
    _calendarState = CalendarState.initial().obs;
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
  }
}
