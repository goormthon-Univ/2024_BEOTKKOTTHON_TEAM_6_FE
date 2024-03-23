class CalendarState {
  final DateTime todayDate;
  final DateTime selectedDate;
  final DateTime focusedDate;

  CalendarState({
    required this.todayDate,
    required this.selectedDate,
    required this.focusedDate,
  });

  factory CalendarState.initial() {
    return CalendarState(
      todayDate: DateTime.now(),
      selectedDate: DateTime.now(),
      focusedDate: DateTime.now(),
    );
  }

  CalendarState copyWith({
    DateTime? todayDate,
    DateTime? selectedDate,
    DateTime? focusedDate,
  }) {
    return CalendarState(
      todayDate: todayDate ?? this.todayDate,
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDate: focusedDate ?? this.focusedDate,
    );
  }
}
