import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:rebook/app/factory/secure_storage_factory.dart';
import 'package:rebook/app/main_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:intl/date_symbol_data_local.dart';
// import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await onSystemInit();
  runApp(const MainApp());
}

Future<void> onSystemInit() async {
  // WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Date Binding
  await initializeDateFormatting();
  // tz.initializeTimeZones();

  // Environment
  await dotenv.load(fileName: "assets/config/.env");
  KakaoSdk.init(nativeAppKey: "${dotenv.env['KAKAO_APP_KEY']}");

  // Factory
  await SecureStorageFactory().onInit();
}
