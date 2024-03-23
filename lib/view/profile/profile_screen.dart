import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/profile/widget/env_thermostat_card.dart';
import 'package:rebook/view/profile/widget/profile_quiz_history_card.dart';
import 'package:rebook/view/profile/widget/user_brief_view.dart';
import 'package:rebook/view/profile/widget/weekly_calendar.dart';
import 'package:rebook/view_model/profile/profile_view_model.dart';
import 'package:rebook/widget/appbar/default_white_svg_appbar.dart';
import 'package:rebook/widget/dialog/quiz_dialog.dart';

class ProfileScreen extends BaseScreen<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  bool get wrapWithInnerSafeArea => true;

  @override
  bool get setTopInnerSafeArea => true;

  @override
  Color? get screenBackgroundColor => ColorSystem.grey[300];

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: DefaultWhiteSvgAppBar(
        svgPath: 'assets/images/appbar_rebook_logo.svg',
        height: 24,
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const WeeklyCalendar(),
        Container(
          color: ColorSystem.white,
          height: 12,
        ),
        const UserBriefView(),
        Expanded(
          child: Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
              ),
              itemCount: viewModel.profileCardStates.length,
              itemBuilder: (context, index) {
                if (viewModel.profileCardStates[index].isEnvCard) {
                  return const EnvThermostatCard();
                }

                return ProfileQuizHistoryCard(
                  index: index,
                  state: viewModel.profileCardStates[index].quizHistoryState!,
                  onTap: () {
                    viewModel.fetchQuizHistoryDetail(index);
                    Get.dialog(
                      Obx(
                        () => QuizDialog(
                          isLoading: viewModel.isLoadingWhenOpenDialog,
                          state: viewModel.quizHistoryState,
                          onTapChoice: (value) {
                            return;
                          },
                          onGiveUpOrExit: () {
                            Get.back();
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
