import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_widget.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class EnvThermostatCard extends BaseWidget<RootViewModel> {
  const EnvThermostatCard({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(
          left: 16,
          top: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorSystem.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                "나의 환경온도",
                style: FontSystem.KR24B.copyWith(
                  color: const Color(0xFF5356FF),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${viewModel.userState.environmentalTemperature}°",
                    style: FontSystem.KR24B.copyWith(
                      color: const Color(0xFF5356FF),
                    ),
                  ),
                  SvgPicture.asset('assets/icons/thermostat.svg'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              lineHeight: 15.0,
              percent:
                  double.parse(viewModel.userState.environmentalTemperature) /
                      100,
              barRadius: const Radius.circular(10),
              progressColor: const Color(0xFF85D4EC),
              backgroundColor: const Color(0xFFE6E6E6),
            ),
          ],
        ),
      ),
    );
  }
}
