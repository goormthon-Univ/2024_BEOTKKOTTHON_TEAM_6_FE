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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: Colors.white,
//         title: SvgPicture.asset('assets/icons/REBOOK.svg'),
//         actions: [
//           iconButton('alarm', 0),
//           iconButton('bookmark', 20),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Opacity(
//             opacity: 0.5,
//             child: Container(
//               width: Get.width,
//               height: Get.height,
//               color: Color(0xffE0E0E0),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     width: Get.width,
//                     height: 180,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(45),
//                         bottomLeft: Radius.circular(45),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Column(
//                       children: [
//                         Calendar(),
//                         SizedBox(height: 10),
//                         _profile(context),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: () {},
//                             child: Container(
//                               width: (Get.width - 48) / 2,
//                               height: (Get.width - 48) / 2,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(45),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       '캐릭터 꾸미기',
//                                       style: FontSystem.KR24B.copyWith(
//                                         color: Color(0xFF5356FF),
//                                       ),
//                                     ),
//                                     SizedBox(height: 16),
//                                     SvgPicture.asset('assets/icons/turtle.svg'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 32.0, bottom: 16.0),
//                         child: Text(
//                           '내가 풀었던 퀴즈',
//                           style: FontSystem.KR24B.copyWith(
//                             color: Color(0xff5356FF),
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       quiz('1. 비닐', '정답', 0xff006DE2),
//                       quiz('2. 비닐', '오답', 0xffFF2A2A),
//                       quiz('1. 종이', '정답', 0xff006DE2),
//                       quiz('1. 비닐', '정답', 0xff006DE2),
//                       quiz('1. 비닐', '정답', 0xff006DE2),
//                       quiz('1. 비닐', '정답', 0xff006DE2),
//                       quiz('1. 비닐', '오답', 0xffFF2A2A),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
}
