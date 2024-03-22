import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/home/home_screen.dart';
import 'package:rebook/view/load_map/load_map_screen.dart';
import 'package:rebook/view/profile/profile_screen.dart';
import 'package:rebook/view/root/widget/custom_bottom_navigation_bar.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: viewModel.selectedIndex,
        children: [
          LoadMapScreen(),
          const HomeScreen(),
          const ProfileScreen(),
        ],
      ),
    );
  }

  @override
  bool get extendBodyBehindAppBar => true;

  @override
  Widget? buildBottomNavigationBar(BuildContext context) =>
      const CustomBottomNavigationBar();
}
