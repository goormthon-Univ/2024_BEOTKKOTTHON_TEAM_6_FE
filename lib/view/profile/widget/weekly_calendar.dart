import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rebook/utility/functions/log_util.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view_model/profile/profile_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendar extends BaseWidget<ProfileViewModel> {
  const WeeklyCalendar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: ColorSystem.white,
      child: Column(
        children: [
          Obx(
            () => TableCalendar(
              // Default Properties
              locale: Get.deviceLocale.toString(),
              firstDay: viewModel.calendarState.todayDate
                  .subtract(const Duration(days: 365)),
              lastDay: viewModel.calendarState.todayDate
                  .add(const Duration(days: 365)),

              // Date Properties
              currentDay: viewModel.calendarState.todayDate,
              focusedDay: viewModel.calendarState.focusedDate,
              calendarFormat: CalendarFormat.week,
              daysOfWeekVisible: true,
              daysOfWeekHeight: 20,

              // Style Properties
              calendarStyle: CalendarStyle(
                defaultTextStyle: FontSystem.KR16R.copyWith(
                  color: const Color(0xff5356FF),
                ),
                weekendTextStyle: FontSystem.KR16R.copyWith(
                  color: const Color(0xff5356FF),
                ),
                outsideTextStyle: FontSystem.KR16R.copyWith(
                  color: ColorSystem.grey,
                ),
                todayTextStyle: FontSystem.KR16R.copyWith(
                  color: const Color(0xff5356FF),
                ),
                todayDecoration: const BoxDecoration(
                  color: Color(0xff5356FF),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Color(0xff5356FF),
                  shape: BoxShape.circle,
                ),
              ),

              // Calendar Properties
              headerVisible: false,
              selectedDayPredicate: (day) =>
                  isSameDay(day, viewModel.calendarState.selectedDate),
              enabledDayPredicate: (DateTime date) {
                DateTime localDate = date.toLocal().subtract(Duration(
                      hours: date.toLocal().timeZoneOffset.inHours,
                    ));
                return localDate.isBefore(viewModel.calendarState.todayDate);
              },

              // Event Properties
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(
                    selectedDay, viewModel.calendarState.selectedDate)) {
                  viewModel.changeSelectedDate(selectedDay);
                }
              },
              onPageChanged: (focusedDay) {
                viewModel.updateFocusedDate(focusedDay);
              },

              // Calendar Builders
              calendarBuilders: CalendarBuilders(
                disabledBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Text(
                      day.day.toString(),
                      style: FontSystem.KR16R
                          .copyWith(color: ColorSystem.grey[300]),
                    ),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Text(
                      day.day.toString(),
                      style: FontSystem.KR16R
                          .copyWith(color: const Color(0xff5356FF)),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  viewModel
                      .updateFocusedDate(viewModel.calendarState.selectedDate);
                },
                child: Text(
                  DateFormat.yMMMMEEEEd(Get.deviceLocale.toString())
                      .format(viewModel.calendarState.selectedDate),
                  style:
                      FontSystem.KR16B.copyWith(color: const Color(0xff5356FF)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
