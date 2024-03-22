import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  late final PageController _pageController;

  PageController get pageController => _pageController;

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController(viewportFraction: 0.83);
  }
}
