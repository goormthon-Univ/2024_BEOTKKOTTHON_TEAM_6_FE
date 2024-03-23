import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:rebook/app/factory/secure_storage_factory.dart';
import 'package:rebook/app/main_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rebook/provider/base/base_web_socket.dart';

void main() async {
  await onSystemInit();
  runApp(const MainApp());
}

Future<void> onSystemInit() async {
  // WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Environment
  await dotenv.load(fileName: "assets/config/.env");
  KakaoSdk.init(nativeAppKey: "${dotenv.env['KAKAO_APP_KEY']}");

  // Factory
  await SecureStorageFactory().onInit();
}
