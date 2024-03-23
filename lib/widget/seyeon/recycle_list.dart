// recycle_list.dart

import 'package:flutter/material.dart';
import 'recycle_button.dart';
import 'study_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecycleList extends StatelessWidget {
  const RecycleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: SvgPicture.asset(
                        'assets/images/recycle.svg',
                        width: 21,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '재활용 둘러보기',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildRecycleButtons(),
                _buildRecyclePictures(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecycleButtons() {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            for (final item in ['종이', '유리', '플라스틱', '캔', '의류'])
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: MyButton(
                  onPressed: () {},
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

  Widget _buildRecyclePictures() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        // Wrap the Column in a Padding widget
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 15),
            _buildRowOfPictures(['paper2.png', 'paper_cup.png']),
            SizedBox(height: 10),
            _buildRowOfPictures(['paper_bag.png', 'papers.png']),
            SizedBox(height: 10),
            _buildRowOfPictures(['paper2.png', 'paper_cup.png']),
            SizedBox(height: 10),
            _buildRowOfPictures(['paper2.png', 'paper_cup.png']),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRowOfPictures(List<String> imagePaths) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imagePaths.map((path) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            // Add right padding as well
            child: StudyPicture(
              imagePath: 'assets/images/$path',
            ),
          );
        }).toList(),
      ),
    );
  }
}
