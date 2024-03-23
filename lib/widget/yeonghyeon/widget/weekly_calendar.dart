import 'package:contact/font_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

DateTime date = DateTime.now();

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2023, 3, 23), // 현재 날짜 +1, -1년
          lastDay: DateTime.utc(2025, 3, 23),
          calendarStyle: CalendarStyle(
            defaultTextStyle: FontSystem.KR16R.copyWith(
              color: Color(0xff5356FF),
            ),
            weekendTextStyle: FontSystem.KR16R.copyWith(
              color: Color(0xff5356FF),
            ),
            outsideTextStyle: FontSystem.KR16R.copyWith(
              color: Color(0xff5356FF),
            ),
            todayTextStyle: FontSystem.KR16R.copyWith(
              color: Colors.white,
            ),
            todayDecoration: const BoxDecoration(
              color: Color(0xff5356FF),
              shape: BoxShape.circle,
            ),
          ),
          calendarFormat: CalendarFormat.week,
          headerVisible: false,
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontSize: 0),
            weekendStyle: TextStyle(fontSize: 0),
          ),
          daysOfWeekHeight: 0,
        ),
        Text(
          DateFormat('yyyy년 M월 dd일 E요일', 'ko_KR').format(date),
          style: FontSystem.KR12B.copyWith(
            color: Color(0xff5356FF),
          ),
        ),
      ],
    );
  }
}
