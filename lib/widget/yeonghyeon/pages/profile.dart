import 'package:contact/font_system.dart';
import 'package:contact/pages/setting.dart';
import 'package:contact/widget/weekly_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget quiz(String item, answer, color) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: Get.width - 32,
        height: 69,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  item,
                  style: FontSystem.KR24R,
                ),
                Spacer(),
                Text(
                  answer,
                  style: FontSystem.KR16B.copyWith(
                    color: Color(color),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profile(BuildContext context) {
    return Container(
      width: Get.width - 32,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xff8385FF),
        borderRadius: BorderRadius.circular(45),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Avatar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '유저닉네임',
                      style: FontSystem.KR14M.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '#회원코드',
                      style: FontSystem.KR12R.copyWith(
                        color: Color(0xffD4D4D4),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 170),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/settings.svg'),
          ),
        ],
      ),
    );
  }

  Widget iconButton(String name, double num) {
    return IconButton(
      padding: EdgeInsets.only(right: num),
      visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
      onPressed: () {},
      icon: SvgPicture.asset('assets/icons/$name.svg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/icons/REBOOK.svg'),
        actions: [
          iconButton('alarm', 0),
          iconButton('bookmark', 20),
        ],
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Color(0xffE0E0E0),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(45),
                        bottomLeft: Radius.circular(45),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Calendar(),
                        SizedBox(height: 10),
                        _profile(context),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: (Get.width - 48) / 2,
                            height: (Get.width - 48) / 2,
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Text(
                                      "나의 환경온도",
                                      style: FontSystem.KR24B.copyWith(
                                        color: Color(0xFF5356FF),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "30°",
                                          style: FontSystem.KR24B.copyWith(
                                            color: Color(0xFF5356FF),
                                          ),
                                        ),
                                        SvgPicture.asset(
                                            'assets/icons/thermostat.svg'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  LinearPercentIndicator(
                                    padding: EdgeInsets.zero,
                                    lineHeight: 15.0,
                                    percent: 0.5,
                                    barRadius: Radius.circular(10),
                                    progressColor: Color(0xFF85D4EC),
                                    backgroundColor: Color(0xFFE6E6E6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: (Get.width - 48) / 2,
                              height: (Get.width - 48) / 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '캐릭터 꾸미기',
                                      style: FontSystem.KR24B.copyWith(
                                        color: Color(0xFF5356FF),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    SvgPicture.asset('assets/icons/turtle.svg'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 32.0, bottom: 16.0),
                        child: Text(
                          '내가 풀었던 퀴즈',
                          style: FontSystem.KR24B.copyWith(
                            color: Color(0xff5356FF),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      quiz('1. 비닐', '정답', 0xff006DE2),
                      quiz('2. 비닐', '오답', 0xffFF2A2A),
                      quiz('1. 종이', '정답', 0xff006DE2),
                      quiz('1. 비닐', '정답', 0xff006DE2),
                      quiz('1. 비닐', '정답', 0xff006DE2),
                      quiz('1. 비닐', '정답', 0xff006DE2),
                      quiz('1. 비닐', '오답', 0xffFF2A2A),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
