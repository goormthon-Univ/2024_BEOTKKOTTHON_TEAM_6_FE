import 'package:get/get.dart';
import 'package:rebook/binding/challenge_authentication_binding.dart';
import 'package:rebook/binding/matching_binding.dart';
import 'package:rebook/binding/root_binding.dart';
import 'package:rebook/middleware/login_middleware.dart';
import 'package:rebook/view/challenge_authentication/challenge_authentication_screen.dart';
import 'package:rebook/view/load_map/load_map_screen.dart';
import 'package:rebook/view/login/login_screen.dart';
import 'package:rebook/view/matching/matching_screen.dart';
import 'package:rebook/view/root/root_screen.dart';

import 'app_routes.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
    middlewares: [
      LoginMiddleware(),
    ],
  ),
  GetPage(
    name: Routes.MATCHING,
    page: () => const MatchingScreen(),
    binding: MatchingBinding(),
  ),
  GetPage(
    name: Routes.LOGIN,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.LOAD_MAP,
    page: () => LoadMapScreen(),
    binding: LoadMapBinding(),
  ),
  GetPage(
    name: Routes.CHALLENGE_AUTHENTICATION,
    page: () => const ChallengeAuthenticationScreen(),
    binding: ChallengeAuthenticationBinding(),
  ),
];
