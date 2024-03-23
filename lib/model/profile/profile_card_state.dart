import 'package:rebook/model/home/quiz_history_state.dart';

class ProfileCardState {
  final bool isEnvCard;
  final QuizHistoryState? quizHistoryState;

  ProfileCardState({
    required this.isEnvCard,
    this.quizHistoryState,
  });

  ProfileCardState copyWith({
    bool? isEnvCard,
    QuizHistoryState? quizHistoryState,
  }) {
    return ProfileCardState(
      isEnvCard: isEnvCard ?? this.isEnvCard,
      quizHistoryState: quizHistoryState ?? this.quizHistoryState,
    );
  }
}
