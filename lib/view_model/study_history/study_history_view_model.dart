import 'package:get/get.dart';
import 'package:rebook/model/study_history/category_state.dart';
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
  late final RxList<CategoryState> _categoryStates;
  late final RxList<StudyHistoryState> _studyHistoryStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isEnableBookmarkMode => _isEnableBookmarkMode.value;
  List<CategoryState> get categoryStates => _categoryStates;
  List<StudyHistoryState> get studyHistoryStates => _studyHistoryStates;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _studyHistoryRepository = Get.find<StudyHistoryRepository>();

    // Private Fields
    _isEnableBookmarkMode = false.obs;
    _categoryStates = CategoryState.categoryStates.obs;
    _studyHistoryStates = RxList<StudyHistoryState>.empty(growable: true);
  }

  @override
  void onReady() {
    super.onReady();

    fetchStudyHistoryByCategoryAndIsMarking(ERecycle.paper, false);
  }

  void fetchStudyHistoryByCategoryAndIsMarking(
      ERecycle category, bool isMarking) async {
    _studyHistoryStates.clear();
    _studyHistoryStates.addAll(
      await _studyHistoryRepository.readStudyHistoryByCategoryAndIsMarking(
        category,
        isMarking == false ? null : isMarking,
        0,
        10,
      ),
    );
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

  void changeStudyHistoryStateInScreen(int index) {
    _studyHistoryStates[index] = _studyHistoryStates[index].copyWith(
      isMarking: !_studyHistoryStates[index].isMarking,
    );
  }
}
