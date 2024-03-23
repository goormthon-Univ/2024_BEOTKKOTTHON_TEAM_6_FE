// import 'package:contact/pages/withdrawal.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import '../font_system.dart';
// import '../line.dart';
// import '../switch.dart';
// import '../time/custom_time_picker_dialog.dart';
// import '../time/section_item.dart';
//
// class Setting extends StatelessWidget {
//   const Setting({super.key});
//
//   Widget line() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 81,
//         ),
//         Line(
//           height: 2,
//           color: Color(0xffE3E3E3),
//         ),
//       ],
//     );
//   }
//
//   Widget lines() {
//     return Center(
//       child: Column(
//         children: [
//           line(),
//           line(),
//           line(),
//           line(),
//         ],
//       ),
//     );
//   }
//
//   Widget _notificationTimeSection() => SectionItem(
//         onTap: () {
//           Get.dialog(CustomTimePickerDialog(
//             hour: 09,
//             minute: 20,
//             onCancel: () {
//               Get.back();
//             },
//             onConfirm: (hour, minute) {
//               Get.back();
//             },
//           ));
//         },
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset(
//                 'assets/icons/notifications_active.svg',
//               ),
//               SizedBox(width: 5),
//               Text(
//                 "알람 시간".tr,
//                 style: FontSystem.KR20R,
//               ),
//             ],
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(right: 25.0),
//             child: Row(
//               children: [
//                 Text(
//                   // 00 : 00 형태로 표시
//                   "09:00",
//                   style: FontSystem.KR16R,
//                 ),
//                 const SizedBox(width: 3),
//                 SvgPicture.asset(
//                   'assets/icons/right_icon.svg',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xffADAEFF),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: SvgPicture.asset(
//             'assets/icons/arrow_back.svg',
//           ),
//         ),
//         title: Container(
//           margin: EdgeInsets.only(bottom: 4),
//           child: Text(
//             '환경설정',
//             style: FontSystem.KR20B.copyWith(color: Colors.white),
//           ),
//         ),
//         titleSpacing: -9,
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: SvgPicture.asset(
//               'assets/icons/background_icon.svg',
//             ),
//           ),
//           lines(),
//           Padding(
//             padding: const EdgeInsets.only(left: 18.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/edit_notifications.svg',
//                         ),
//                         SizedBox(width: 5),
//                         Text(
//                           '알림 설정',
//                           style: FontSystem.KR20R,
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 15.0),
//                       child: SwitchWidget(),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 28),
//                 _notificationTimeSection(),
//                 SizedBox(height: 33),
//                 InkWell(
//                   onTap: () {},
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/logout.svg',
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         '로그아웃',
//                         style: FontSystem.KR20R,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 53),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Withdrawal(),
//                       ),
//                     );
//                   },
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/person_off.svg',
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         '회원탈퇴',
//                         style:
//                             FontSystem.KR20R.copyWith(color: Color(0xffFF0000)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
