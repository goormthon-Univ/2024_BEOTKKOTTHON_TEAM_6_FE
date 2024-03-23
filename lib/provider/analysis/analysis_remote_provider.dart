import 'dart:io';

abstract class AnalysisRemoteProvider {
  Future<Map<String, dynamic>> postImageForAnalysis(File image);
}
