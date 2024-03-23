import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
    this.children = const [],
    this.onTap,
  });

  final List<Widget> children;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
