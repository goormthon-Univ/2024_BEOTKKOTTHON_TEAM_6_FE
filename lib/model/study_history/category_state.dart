import 'package:rebook/model/type/e_recycle.dart';

class CategoryState {
  final ERecycle category;
  final bool isSelected;

  CategoryState({
    required this.category,
    required this.isSelected,
  });

  CategoryState copyWith({
    ERecycle? category,
    bool? isSelected,
  }) {
    return CategoryState(
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  static List<CategoryState> get categoryStates => [
        CategoryState(category: ERecycle.paper, isSelected: true),
        CategoryState(category: ERecycle.plastic, isSelected: false),
        CategoryState(category: ERecycle.glass, isSelected: false),
        CategoryState(category: ERecycle.can, isSelected: false),
        CategoryState(category: ERecycle.clothing, isSelected: false),
      ];
}
