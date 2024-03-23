import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../font_system.dart';
import '../rounded_rectangle_text_button.dart';

class Withdrawal extends StatelessWidget {
  const Withdrawal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffADAEFF),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow_back.svg',
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(bottom: 4),
          child: Text(
            '회원탈퇴',
            style: FontSystem.KR20B.copyWith(color: Colors.white),
          ),
        ),
        titleSpacing: -9,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(50),
              child: SvgPicture.asset(
                'assets/icons/withdrawal_icon.svg',
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              width: Get.width - 130,
              height: 310,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '주의하세요!',
                      style:
                          FontSystem.KR24B.copyWith(color: Color(0xffFF0000)),
                    ),
                  ),
                  Text(
                    '탈퇴시 삭제/유지되는 정보를 확인하세요!\n한번 삭제된 정보는 복구가 불가능합니다.\n계정 및 프로필 정보 삭제\n여행 포인트 및 레벨 삭제 (혜택 포함)\n내 예약 정보 삭제\n쿠폰 삭제\n캐시 삭제\n내 여행 및 장소 저장 정보 삭제\n공유 일정 및 리뷰, 사진 유지',
                    style: FontSystem.KR14R.copyWith(color: Color(0xff494949)),
                  ),
                ],
              ),
            ),
            RoundedRectangleTextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              width: Get.width - 32,
              height: 64,
              text: '취소하기',
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard',
              ),
              foregroundColor: Colors.white,
              backgroundColor: Color(0xff5356FF),
            ),
            SizedBox(
              height: 15,
            ),
            RoundedRectangleTextButton(
              onPressed: () {},
              width: Get.width - 32,
              height: 64,
              text: '정말탈퇴',
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard',
              ),
              foregroundColor: Color(0xff5356FF),
              backgroundColor: Colors.white,
              borderSide: BorderSide(
                color: Color(0xff5356FF),
                width: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
