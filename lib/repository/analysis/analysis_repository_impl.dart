import 'dart:io';

import 'package:get/get.dart';
import 'package:rebook/model/study_by_image/analysis_image_result_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/provider/analysis/analysis_remote_provider.dart';
import 'package:rebook/repository/analysis/analysis_repository.dart';

class AnalysisRepositoryImpl extends GetxService implements AnalysisRepository {
  late final AnalysisRemoteProvider _analysisProvider;

  @override
  void onInit() {
    super.onInit();

    _analysisProvider = Get.find<AnalysisRemoteProvider>();
  }

  @override
  Future<AnalysisImageResultState?> analysisImage(File image) async {
    Map<String, dynamic> data;

    try {
      data = await _analysisProvider.poseImageForAnalysis(image);
    } catch (e) {
      return null;
    }

    //   final bool completeTodayCurrentChallenge;
    //   final ERecycle recycleCategory;
    //   final String information;
    //   final String createdAt;
    return AnalysisImageResultState(
      completeTodayCurrentChallenge: true,
      recycleCategory: ERecycle.paper,
      information: "asdfasdf",
      createdAt: "2021-09-01",
    );
  }
}
