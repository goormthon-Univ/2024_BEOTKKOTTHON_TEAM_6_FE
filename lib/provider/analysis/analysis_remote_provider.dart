import 'dart:io';

abstract class AnalysisRemoteProvider {
  Future<Map<String, dynamic>> poseImageForAnalysis(File image);
}
