import 'package:get/get.dart';
import 'package:rebook/provider/base/base_connect.dart';
import 'package:rebook/provider/user/user_remote_provider.dart';

class UserRemoteProviderImpl extends BaseConnect implements UserRemoteProvider {
  @override
  Future<Map<String, dynamic>> getUserInformation() async {
    final Response response;

    try {
      response = await get(
        '/api/v1/users',
      );
    } catch (e) {
      rethrow;
    }

    return response.body['data'];
  }
}
