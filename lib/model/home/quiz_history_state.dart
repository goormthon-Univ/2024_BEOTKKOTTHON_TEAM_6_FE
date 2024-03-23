import 'package:rebook/model/type/e_recycle.dart';

class QuizHistoryState {
  final ERecycle category;
  final String content;
  final bool? userAnswer;
  final bool? validAnswer;

  QuizHistoryState({
    required this.category,
    this.content = '',
    this.userAnswer,
    this.validAnswer,
  });

  QuizHistoryState copyWith({
    ERecycle? category,
    String? content,
    bool? userAnswer,
    bool? validAnswer,
  }) {
    return QuizHistoryState(
      category: category ?? this.category,
      content: content ?? this.content,
      userAnswer: userAnswer ?? this.userAnswer,
      validAnswer: validAnswer ?? this.validAnswer,
    );
  }

  factory QuizHistoryState.initial() {
    return QuizHistoryState(
      category: ERecycle.paper,
    );
  }

  factory QuizHistoryState.fromJson(Map<String, dynamic> data) {
    return QuizHistoryState(
      category: ERecycle.fromEn(data['category'] as String),
      content: data['content'] as String,
      userAnswer: data['userAnswer'] as bool?,
      validAnswer: data['validAnswer'] as bool?,
    );
  }
}
