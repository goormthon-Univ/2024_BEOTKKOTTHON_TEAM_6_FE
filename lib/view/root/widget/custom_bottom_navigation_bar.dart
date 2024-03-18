import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view/root/widget/animated_bar.dart';
import 'package:rebook/view_model/root/root_view_model.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class CustomBottomNavigationBar extends BaseWidget<RootViewModel> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 36),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2326D4),
            Color(0xFF7274FF),
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2326D4).withOpacity(0.7),
            offset: const Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          viewModel.bottomNavItems.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                viewModel.riveIconInputs[index].change(true);
                Future.delayed(const Duration(milliseconds: 100), () {
                  viewModel.riveIconInputs[index].change(false);
                });
                viewModel.fetchIndex(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => AnimatedBar(
                      isActive: viewModel.selectedIndex == index,
                    ),
                  ),
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: RiveAnimation.asset(
                      viewModel.bottomNavItems[index].src,
                      artboard: viewModel.bottomNavItems[index].artBoard,
                      onInit: (Artboard artBoard) {
                        viewModel.riveOnInIt(
                          artBoard,
                          stateMachineName:
                              viewModel.bottomNavItems[index].stateMachineName,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
