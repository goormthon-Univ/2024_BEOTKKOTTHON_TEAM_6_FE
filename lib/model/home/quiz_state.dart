import 'package:rebook/model/type/e_recycle.dart';

class QuizState {
  final int quizId;
  final ERecycle category;
  final bool isChanged;
  final int? quizHistoryId;

  QuizState({
    required this.quizId,
    required this.category,
    this.isChanged = false,
    this.quizHistoryId,
  });

  QuizState copyWith({
    int? quizId,
    ERecycle? category,
    int? quizHistoryId,
    bool? isChanged,
  }) {
    return QuizState(
      quizId: quizId ?? this.quizId,
      category: category ?? this.category,
      quizHistoryId: quizHistoryId ?? this.quizHistoryId,
      isChanged: isChanged ?? this.isChanged,
    );
  }

  factory QuizState.fromJson(Map<String, dynamic> data) {
    return QuizState(
      quizId: data['id'] as int,
      category: ERecycle.fromEn(data['category'] as String),
      quizHistoryId: data['quizHistoryId'] as int?,
      isChanged: false,
    );
  }
}
