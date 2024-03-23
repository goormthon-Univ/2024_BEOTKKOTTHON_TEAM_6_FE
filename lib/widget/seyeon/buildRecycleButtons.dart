// buildRecycle_buttons.dart
import 'package:flutter/material.dart';
import 'recycle_button.dart';

class _buildRecycleButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            for (final item in ['종이', '유리', '플라스틱', '캔', '의류', '일반 쓰레기'])
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: MyButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/RecyclePhotos');
                  },
                  label: item,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
