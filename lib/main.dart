import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:rebook/app/main_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rebook/view/login/login_screen.dart';

void main() async{
  await onSystemInit();
  runApp(const MainApp());
}

Future<void> onSystemInit() async {
  // Environment
  await dotenv.load(fileName: "assets/config/.env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: "${dotenv.env['KAKAO_APP_KEY']}");
}