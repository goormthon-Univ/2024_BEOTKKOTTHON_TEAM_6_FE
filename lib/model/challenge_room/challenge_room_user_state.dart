class ChallengeRoomUserState {
  final String userId;
  final String userNickname;
  final List<StudyHistories> studyHistories;

  ChallengeRoomUserState({
    required this.userId,
    required this.userNickname,
    required this.studyHistories,
  });

  ChallengeRoomUserState copyWith({
    String? userId,
    String? userNickname,
    List<StudyHistories>? studyHistories,
  }) {
    return ChallengeRoomUserState(
      userId: userId ?? this.userId,
      userNickname: userNickname ?? this.userNickname,
      studyHistories: studyHistories ?? this.studyHistories,
    );
  }

  factory ChallengeRoomUserState.initial() {
    return ChallengeRoomUserState(
      userId: '',
      userNickname: '사용자',
      studyHistories: [StudyHistories(id: 1, category: 'paper')],
    );
  }

  factory ChallengeRoomUserState.fromJson(Map<String, dynamic> json) {
    var studyHistoriesFromJson = json['studyHistories'] as List;
    List<StudyHistories> studyHistoriesList =
        studyHistoriesFromJson.map((i) => StudyHistories.fromJson(i)).toList();

    return ChallengeRoomUserState(
      userId: json['userId'],
      userNickname: json['userNickname'],
      studyHistories: studyHistoriesList,
    );
  }

  @override
  String toString() {
    return 'ChallengeRoomUserState(userId: $userId, userNickname: $userNickname, studyHistories: $studyHistories)';
  }
}

class StudyHistories {
  final int id;
  final String category;

  StudyHistories({
    required this.id,
    required this.category,
  });

  StudyHistories copyWith({
    int? id,
    String? category,
  }) {
    return StudyHistories(
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  factory StudyHistories.fromJson(Map<String, dynamic> json) {
    return StudyHistories(
      id: json['id'],
      category: json['category'],
    );
  }

  @override
  String toString() {
    return 'StudyHistories(id: $id, category: $category)';
  }
}
