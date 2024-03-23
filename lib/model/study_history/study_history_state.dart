class StudyHistoryState {
  final int id;
  final String imageUrl;
  final bool isMarking;

  StudyHistoryState({
    required this.id,
    required this.imageUrl,
    required this.isMarking,
  });

  StudyHistoryState copyWith({
    int? id,
    String? imageUrl,
    bool? isMarking,
  }) {
    return StudyHistoryState(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      isMarking: isMarking ?? this.isMarking,
    );
  }

  factory StudyHistoryState.fromJson(Map<String, dynamic> json) {
    return StudyHistoryState(
      id: json['id'],
      imageUrl: json['imageUrl'],
      isMarking: json['isMarking'],
    );
  }
}
