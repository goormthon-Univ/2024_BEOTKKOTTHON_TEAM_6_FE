import 'dart:io';

import 'package:get/get.dart';
import 'package:rebook/provider/analysis/analysis_remote_provider.dart';
import 'package:rebook/provider/base/base_connect.dart';

class AnalysisRemoteProviderImpl extends BaseConnect
    implements AnalysisRemoteProvider {
  @override
  String get defaultContentType => 'multipart/form-data';

  @override
  Future<Map<String, dynamic>> poseImageForAnalysis(File image) async {
    Response response;

    try {
      response = await post(
        '/api/v1/analysis/image',
        FormData({
          'image': MultipartFile(image, filename: '${DateTime.now()}.png'),
        }),
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }
}
