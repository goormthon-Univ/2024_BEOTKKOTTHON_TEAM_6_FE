import 'package:rebook/model/home/quiz_state.dart';

class CardState {
  final bool isCharacterCard;
  final QuizState? quizState;

  CardState({
    required this.isCharacterCard,
    this.quizState,
  });

  CardState copyWith({
    bool? isCharacterCard,
    QuizState? quizState,
  }) {
    return CardState(
      isCharacterCard: isCharacterCard ?? this.isCharacterCard,
      quizState: quizState ?? this.quizState,
    );
  }
}
