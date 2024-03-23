import 'package:flutter/material.dart';
import 'Photos.dart';

class RecyclePhotos extends StatefulWidget {
  @override
  _RecyclePhotosState createState() => _RecyclePhotosState();
}

class _RecyclePhotosState extends State<RecyclePhotos> {
  String selectedCategory = '종이'; // 기본 선택 카테고리

  // 예제 사진 목록
  final List<Photo> photos = [
    Photo(imagePath: 'assets/paper2.png', category: '종이'),
    Photo(imagePath: 'assets/paper_bag.png', category: '유리'),
    Photo(imagePath: 'assets/paper_cup.png', category: '플라스틱'),
    // 여기에 더 많은 사진 데이터를 추가하세요.
  ];

  @override
  Widget build(BuildContext context) {
    // 선택된 카테고리에 따라 사진을 필터링합니다.
    List<Photo> filteredPhotos =
        photos.where((photo) => photo.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('재활용 카테고리별 사진'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 한 줄에 표시할 사진의 수
        ),
        itemCount: filteredPhotos.length,
        itemBuilder: (context, index) {
          return Image.asset(filteredPhotos[index].imagePath);
        },
      ),
    );
  }
}
