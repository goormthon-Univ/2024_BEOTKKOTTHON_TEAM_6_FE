import 'package:rebook/model/type/e_recycle.dart';

class QuizHistoryState {
  final int? id;
  final ERecycle category;
  final String content;
  final bool? userAnswer;
  final bool? validAnswer;

  QuizHistoryState({
    this.id,
    required this.category,
    this.content = '',
    this.userAnswer,
    this.validAnswer,
  });

  QuizHistoryState copyWith({
    int? id,
    ERecycle? category,
    String? content,
    bool? userAnswer,
    bool? validAnswer,
  }) {
    return QuizHistoryState(
      id: id ?? this.id,
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
      id: data['id'] as int?,
      category: ERecycle.fromEn(data['category'] as String),
      content: data['content'] as String? ?? '',
      userAnswer: data['userAnswer'] as bool?,
      validAnswer: data['validAnswer'] as bool?,
    );
  }
}
