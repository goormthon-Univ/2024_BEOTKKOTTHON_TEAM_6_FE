import 'package:get/get.dart';
import 'package:rebook/binding/root_binding.dart';
import 'package:rebook/view/login/login_screen.dart';
import 'package:rebook/view/root/root_screen.dart';

import 'app_routes.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.LOGIN,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
];
