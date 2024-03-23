import 'dart:io';

import 'package:rebook/model/study_by_image/analysis_image_result_state.dart';

abstract class AnalysisRepository {
  Future<AnalysisImageResultState?> analysisImage(File image);
}
