import 'package:get/get.dart';
import 'package:rebook/model/root/custom_bottom_navigation_item_state.dart';
import 'package:rebook/model/root/user_state.dart';
import 'package:rebook/repository/user/user_repository.dart';
import 'package:rive/rive.dart';

class RootViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Static Fields ---------------------- */
  /* ------------------------------------------------------ */
  static const duration = Duration(milliseconds: 200);

  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxInt _selectedIndex;
  late final Rx<UserState> _userState;

  late final List<SMIBool> _riveIconInputs;
  late final List<StateMachineController?> _controllers;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  late final List<CustomBottomNavigationItemState> bottomNavItems;

  int get selectedIndex => _selectedIndex.value;
  UserState get userState => _userState.value;

  List<SMIBool> get riveIconInputs => _riveIconInputs;
  List<StateMachineController?> get controllers => _controllers;

  @override
  void onInit() {
    super.onInit();
    // Dependency Injection
    _userRepository = Get.find<UserRepository>();

    // Initialize private fields
    _selectedIndex = 1.obs;
    _userState = UserState.initial().obs;

    _riveIconInputs = [];
    _controllers = [];

    bottomNavItems = [
      CustomBottomNavigationItemState(
          src: "assets/rivs/bottom_navigation_bar_icons.riv",
          artBoard: "CROWN",
          stateMachineName: "CROWN_Interactivity"),
      CustomBottomNavigationItemState(
          src: "assets/rivs/bottom_navigation_bar_icons.riv",
          artBoard: "HOME",
          stateMachineName: "HOME_Interactivity"),
      CustomBottomNavigationItemState(
          src: "assets/rivs/bottom_navigation_bar_icons.riv",
          artBoard: "USER",
          stateMachineName: "USER_Interactivity"),
    ];
  }

  @override
  void onReady() async {
    super.onReady();

    await _userRepository.readUserState().then((value) {
      _userState.value = value;
    });
  }

  @override
  void dispose() {
    super.dispose();

    for (var controller in _controllers) {
      controller?.dispose();
    }
  }

  void fetchIndex(int index) {
    _selectedIndex.value = index;
  }

  void riveOnInIt(Artboard artBoard, {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artBoard, stateMachineName);

    artBoard.addController(controller!);
    _controllers.add(controller);

    _riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  void onIsAlarmSwitch() async {
    _userState.value = _userState.value
        .copyWith(isActiveNotification: !_userState.value.isActiveNotification);

    await _userRepository
        .updateUserNotificationActive(_userState.value.isActiveNotification);
  }

  void changeAlarmTime(int hour, int minute) async {
    _userState.value = _userState.value.copyWith(
      notificationHour: hour,
      notificationMinute: minute,
    );

    await _userRepository.updateUserNotificationTime(hour, minute);
  }
}
