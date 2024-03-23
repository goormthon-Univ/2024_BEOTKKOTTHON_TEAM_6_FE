class StudyHistoryDetailState {
  final String imageUrl;
  final String content;
  final String createdAt;

  StudyHistoryDetailState({
    required this.imageUrl,
    required this.content,
    required this.createdAt,
  });

  StudyHistoryDetailState copyWith({
    String? imageUrl,
    String? content,
    String? createdAt,
  }) {
    return StudyHistoryDetailState(
      imageUrl: imageUrl ?? this.imageUrl,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory StudyHistoryDetailState.fromJson(Map<String, dynamic> json) {
    return StudyHistoryDetailState(
      imageUrl: json['imageUrl'],
      content: json['content'],
      createdAt: json['createdAt'],
    );
  }
}
