import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rebook/model/study_by_image/analysis_image_result_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/repository/analysis/analysis_repository.dart';
import 'package:rebook/view_model/root/root_view_model.dart';
import 'package:rive/rive.dart';

class StudyByImageViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final AnalysisRepository _analysisRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxInt _currentPageIndex;
  late final PageController _pageController;
  late final RiveAnimationController _animationController;

  late final Rxn<XFile?> _image;
  late final Rxn<AnalysisImageResultState> _analysisResultState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get currentPageIndex => _currentPageIndex.value;
  PageController get pageController => _pageController;
  RiveAnimationController get animationController => _animationController;

  XFile? get image => _image.value;
  AnalysisImageResultState? get analysisResultState =>
      _analysisResultState.value;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _analysisRepository = Get.find<AnalysisRepository>();

    // Initialize Private Fields
    _currentPageIndex = 0.obs;
    _pageController = PageController(initialPage: 0);
    _animationController = SimpleAnimation("LoadingAnimation", autoplay: true);

    _image = Rxn<XFile?>();
    _analysisResultState = Rxn<AnalysisImageResultState>();
  }

  @override
  void dispose() {
    super.dispose();
    _image.close();
    _pageController.dispose();
    _animationController.dispose();
  }

  void getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      _image.value = image;
    }
  }

  void analysisImage() async {
    _moveToPage(1);
    await Future.delayed(const Duration(seconds: 1));

    File file = File(_image.value!.path);

    try {
      AnalysisImageResultState? result =
          await _analysisRepository.analysisImage(file);
      _analysisResultState.value = result;
    } catch (e) {
      _analysisResultState.value = null;
    } finally {
      if (_analysisResultState.value != null &&
          _analysisResultState.value!.completeTodayCurrentChallenge) {
        Get.find<RootViewModel>().updateEnvironmentalTemperature();
      }
      _moveToPage(2);
    }
  }

  void _moveToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _currentPageIndex.value = index;
  }
}
