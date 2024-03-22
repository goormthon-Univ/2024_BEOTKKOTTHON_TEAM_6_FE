import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:image_picker/image_picker.dart';

class ChallengeAuthenticationViewModel extends GetxController {

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final PageController _pageController;
  late final RiveAnimationController _animationController;

  late final RxInt _currentPageIndex;
  late final Rxn<XFile?> _image;
  late final RxnBool _isAnalysisResult;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  PageController get pageController => _pageController;
  RiveAnimationController get animationController => _animationController;

  XFile? get image => _image.value;
  int get currentPageIndex => _currentPageIndex.value;
  bool? get isAnalysisResult => _isAnalysisResult.value;

  @override
  void onInit() async {
    super.onInit();

    // Private Fields
    _pageController = PageController(initialPage: 0);
    _animationController = SimpleAnimation("LoadingAnimation", autoplay: true);

    _image = Rxn<XFile?>();
    _currentPageIndex = 0.obs;
    _isAnalysisResult = RxnBool();
  }

  @override
  void dispose() {
    super.dispose();
    _image.close();
    _pageController.dispose();
  }

  void getImage() async {
    final XFile? image =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image.value = image;
    }
  }

  /// Authentication Challenge
  void authenticationChallenge() async {
    // Move to the loading page
    _moveToPage(1);
    await Future.delayed(const Duration(milliseconds: 1));

    // Analysis the image By Server Communication
    // When Exception occurs, Move to the result page(_isAnalysisResult.value is not changed)
    final Map<String, dynamic> result;

    try {
      String base64Image = base64Encode(
        File(_image.value!.path).readAsBytesSync(),
      );

    } catch (e) {
      _moveToPage(2);
      return;
    }

    _moveToPage(2);
  }

  /// Move to the page
  void _moveToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _currentPageIndex.value = index;
  }
}
