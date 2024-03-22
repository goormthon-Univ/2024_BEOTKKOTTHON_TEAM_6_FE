import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/app/factory/secure_storage_factory.dart';
import 'package:rebook/provider/user/token_provider.dart';
import 'package:rebook/utility/static/app_routes.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    TokenProvider userLocalProvider = SecureStorageFactory.tokenProvider;

    if (userLocalProvider.accessToken == null) {
      return const RouteSettings(name: Routes.LOGIN);
    }

    return null;
  }
}
