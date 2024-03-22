import 'package:rebook/model/type/e_recycle.dart';

class QuizDetailState {
  final ERecycle category;
  final String content;
  final bool? result;

  QuizDetailState({
    required this.category,
    this.content = '',
    this.result,
  });

  QuizDetailState copyWith({
    ERecycle? category,
    String? content,
    bool? result,
  }) {
    return QuizDetailState(
      category: category ?? this.category,
      content: content ?? this.content,
      result: result ?? this.result,
    );
  }

  factory QuizDetailState.initial() {
    return QuizDetailState(
      category: ERecycle.paper,
    );
  }

  factory QuizDetailState.fromMap(Map<String, dynamic> data) {
    return QuizDetailState(
      category: ERecycle.fromEn(data['category'] as String),
    );
  }
}
