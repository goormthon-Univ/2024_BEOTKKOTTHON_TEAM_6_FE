import 'package:flutter/cupertino.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: isSwitched,
        activeColor: Color(0xff5356FF),
        onChanged: (bool? value) {
          setState(() {
            isSwitched = value ?? false;
          });
        });
  }
}
