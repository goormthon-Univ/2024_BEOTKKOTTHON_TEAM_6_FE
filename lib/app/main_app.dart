import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:rebook/binding/init_binding.dart';
import 'package:rebook/utility/static/app_pages.dart';
import 'package:rebook/utility/static/app_routes.dart';
import 'package:rebook/utility/system/color_system.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      // App Title
      title: "ReBook",

      locale: Get.deviceLocale,
      fallbackLocale: const Locale('ko', 'KR'),

      // Theme
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        colorSchemeSeed: ColorSystem.green,
        scaffoldBackgroundColor: const Color(0xFFf6f6f8),
      ),

      // initialRoute: Routes.LOGIN, // 로그인 화면으로 시작(TEST)
      initialRoute: Routes.ROOT,
      initialBinding: InitBinding(),
      getPages: appPages,
    );
  }
}
