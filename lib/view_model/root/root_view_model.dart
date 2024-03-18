import 'package:get/get.dart';
import 'package:rebook/model/root/custom_bottom_navigation_item_state.dart';
import 'package:rive/rive.dart';

class RootViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Static Fields ---------------------- */
  /* ------------------------------------------------------ */
  static const duration = Duration(milliseconds: 200);

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxInt _selectedIndex;

  late final List<SMIBool> _riveIconInputs;
  late final List<StateMachineController?> _controllers;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  late final List<CustomBottomNavigationItemState> bottomNavItems;

  int get selectedIndex => _selectedIndex.value;

  List<SMIBool> get riveIconInputs => _riveIconInputs;
  List<StateMachineController?> get controllers => _controllers;

  @override
  void onInit() {
    super.onInit();

    _selectedIndex = 1.obs;

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
  void dispose() {
    // TODO: implement dispose
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
}
