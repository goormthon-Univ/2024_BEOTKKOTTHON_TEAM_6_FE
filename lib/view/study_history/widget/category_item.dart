import 'package:flutter/material.dart';
import 'package:rebook/model/study_history/category_state.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.index,
    required this.listLength,
    required this.state,
    required this.onTap,
  });

  final int index;
  final int listLength;
  final CategoryState state;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? const EdgeInsets.only(left: 20, right: 5)
          : index == listLength - 1
              ? const EdgeInsets.only(left: 5, right: 20)
              : const EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          width: 140,
          height: 48,
          decoration: BoxDecoration(
            color:
                state.isSelected ? const Color(0xFF5356FF) : ColorSystem.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF5356FF),
            ),
          ),
          child: Center(
            child: Text(
              state.category.ko,
              style: state.isSelected
                  ? FontSystem.KR20B.copyWith(color: ColorSystem.white)
                  : FontSystem.KR20B.copyWith(color: const Color(0xFF5356FF)),
            ),
          ),
        ),
      ),
    );
  }
}
