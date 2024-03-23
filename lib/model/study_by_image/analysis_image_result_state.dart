import 'package:rebook/model/type/e_recycle.dart';

class AnalysisImageResultState {
  final bool completeTodayCurrentChallenge;
  final ERecycle recycleCategory;
  final String information;
  final String createdAt;

  AnalysisImageResultState({
    required this.completeTodayCurrentChallenge,
    required this.recycleCategory,
    required this.information,
    required this.createdAt,
  });

  factory AnalysisImageResultState.fromJson(Map<String, dynamic> json) {
    return AnalysisImageResultState(
      completeTodayCurrentChallenge: json['completeTodayCurrentChallenge'],
      recycleCategory: ERecycle.fromEn(json['recycleCategory']),
      information: json['information'],
      createdAt: json['created_at'],
    );
  }
}
