// bookmarkmodel.dart

import 'package:flutter/material.dart';

class BookmarkModel with ChangeNotifier {
  final List<String> _bookmarkedImages = [];

  List<String> get bookmarkedImages => _bookmarkedImages;

  void add(String imagePath) {
    if (!_bookmarkedImages.contains(imagePath)) {
      _bookmarkedImages.add(imagePath);
      notifyListeners();
    }
  }

  void remove(String imagePath) {
    if (_bookmarkedImages.contains(imagePath)) {
      _bookmarkedImages.remove(imagePath);
      notifyListeners();
    }
  }

  bool isBookmarked(String imagePath) {
    return _bookmarkedImages.contains(imagePath);
  }
}
