class ChallengeDetailState {
  final String description;
  final bool canParticipate;

  ChallengeDetailState({
    required this.description,
    required this.canParticipate,
  });

  /// 첫번째 챌린지: 디폴트 설명
  ChallengeDetailState.initial()
      : description = '기본 설명',
        canParticipate = false;

  ChallengeDetailState copyWith({
    String? description,
    bool? canParticipate,
  }) {
    return ChallengeDetailState(
      description: description ?? this.description,
      canParticipate: canParticipate ?? this.canParticipate,
    );
  }

  factory ChallengeDetailState.fromJson(Map<String, dynamic> json) {
    return ChallengeDetailState(
      description: json['description'],
      canParticipate: json['canParticipate'],
    );
  }

  @override
  String toString() {
    return 'ChallengeDetailState(description: $description, canParticipate: $canParticipate)';
  }
}
