import 'package:get/get.dart';
import 'package:rebook/model/study_history/category_state.dart';
import 'package:rebook/model/study_history/study_history_detail_state.dart';
import 'package:rebook/model/study_history/study_history_state.dart';
import 'package:rebook/model/type/e_recycle.dart';
import 'package:rebook/repository/study_history/study_history_repository.dart';

class StudyHistoryViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final StudyHistoryRepository _studyHistoryRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isEnableBookmarkMode;
  late final RxBool _isLoading;
  late final RxBool _isLoadingDetail;
  late final RxList<CategoryState> _categoryStates;
  late final RxList<StudyHistoryState> _studyHistoryStates;
  late final Rx<StudyHistoryDetailState> _studyHistoryDetailState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isEnableBookmarkMode => _isEnableBookmarkMode.value;
  bool get isLoading => _isLoading.value;
  bool get isLoadingDetail => _isLoadingDetail.value;
  List<CategoryState> get categoryStates => _categoryStates;
  List<StudyHistoryState> get studyHistoryStates => _studyHistoryStates;
  StudyHistoryDetailState get studyHistoryDetailState =>
      _studyHistoryDetailState.value;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _studyHistoryRepository = Get.find<StudyHistoryRepository>();

    // Private Fields
    _isEnableBookmarkMode = false.obs;
    _isLoading = false.obs;
    _isLoadingDetail = false.obs;
    _categoryStates = CategoryState.categoryStates.obs;
    _studyHistoryStates = RxList<StudyHistoryState>.empty(growable: true);
    _studyHistoryDetailState = StudyHistoryDetailState.initial().obs;
  }

  @override
  void onReady() {
    super.onReady();

    fetchStudyHistoryByCategoryAndIsMarking(ERecycle.paper, false);
  }

  void fetchStudyHistoryDetail(int index) async {
    _isLoadingDetail.value = true;
    _studyHistoryDetailState.value = await _studyHistoryRepository
        .readStudyHistory(_studyHistoryStates[index].id);
    _isLoadingDetail.value = false;
  }

  void fetchStudyHistoryByCategoryAndIsMarking(
      ERecycle category, bool isMarking) async {
    _isLoading.value = true;
    _studyHistoryStates.clear();
    _studyHistoryStates.addAll(
      await _studyHistoryRepository.readStudyHistoryByCategoryAndIsMarking(
        category,
        isMarking == false ? null : isMarking,
        0,
        10,
      ),
    );
    _isLoading.value = false;
  }

  void changeBookmarkMode() {
    _isEnableBookmarkMode.value = !_isEnableBookmarkMode.value;
    ERecycle category =
        _categoryStates.firstWhere((element) => element.isSelected).category;

    fetchStudyHistoryByCategoryAndIsMarking(
      category,
      _isEnableBookmarkMode.value,
    );
  }

  void changeCategoryStateInScreen(int index) {
    for (int i = 0; i < _categoryStates.length; i++) {
      if (i == index) {
        _categoryStates[i] = _categoryStates[i].copyWith(isSelected: true);
      } else {
        _categoryStates[i] = _categoryStates[i].copyWith(isSelected: false);
      }
    }

    ERecycle category = _categoryStates[index].category;
    fetchStudyHistoryByCategoryAndIsMarking(
      category,
      _isEnableBookmarkMode.value,
    );
  }

  void changeStudyHistoryStateInScreen(int index) async {
    _studyHistoryStates[index] = _studyHistoryStates[index].copyWith(
      isMarking: !_studyHistoryStates[index].isMarking,
    );

    await _studyHistoryRepository.updateIsMarkingInStudyHistory(
      _studyHistoryStates[index].id,
      _studyHistoryStates[index].isMarking,
    );
  }
}
