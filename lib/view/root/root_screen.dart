import 'package:flutter/material.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view_model/root/root_view_model.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text(
        'RootScreen',
      ),
    );
  }
}
