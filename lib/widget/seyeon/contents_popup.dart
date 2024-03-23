import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentsPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 0,
        top: 50,
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 398,
          height: 930, // Adjust the popup height as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset('assets/images/Icon.svg', width: 21),
                    padding: EdgeInsets.zero, // Set the padding to zero
                    constraints: BoxConstraints(), // Remove constraints
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/recycle.svg',
                        width: 21,
                      ),
                      SizedBox(width: 5), // Corrected the typo here
                      Text(
                        '이면지 활용하기',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset(
                  'assets/images/study_picture_1.png', // Make sure the asset path is correct
                  width: 337,
                  height: 227,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '내용',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
