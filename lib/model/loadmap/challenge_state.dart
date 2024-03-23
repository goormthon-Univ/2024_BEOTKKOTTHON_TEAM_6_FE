class ChallengeState {
  final int id;
  final int? roomId;
  final bool? isCurrentParticipate;

  ChallengeState({
    required this.id,
    this.roomId,
    this.isCurrentParticipate,
  });

  ChallengeState copyWith({
    int? id,
    int? roomId,
    bool? isCurrentParticipate,
  }) {
    return ChallengeState(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      isCurrentParticipate: isCurrentParticipate ?? this.isCurrentParticipate,
    );
  }

  factory ChallengeState.fromJson(Map<String, dynamic> json) {
    return ChallengeState(
      id: json['id'] as int,
      roomId: json['roomId'] as int?,
      isCurrentParticipate: json['isCurrentParticipate'] as bool?,
    );
  }
}
