import 'package:rebook/model/type/e_recycle.dart';

class QuizState {
  final int id;
  final ERecycle category;

  QuizState({
    required this.id,
    required this.category,
  });

  QuizState copyWith({
    int? id,
    ERecycle? category,
  }) {
    return QuizState(
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  factory QuizState.fromMap(Map<String, dynamic> data) {
    return QuizState(
      id: data['id'] as int,
      category: ERecycle.fromEn(data['category'] as String),
    );
  }
}
