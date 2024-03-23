import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bookmark_model.dart';
import 'contents_popup.dart';

class StudyPicture extends StatefulWidget {
  final String imagePath;

  const StudyPicture({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  _StudyPictureState createState() => _StudyPictureState();
}

class _StudyPictureState extends State<StudyPicture> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final bookmarkModel = Provider.of<BookmarkModel>(context);
    isBookmarked = bookmarkModel.isBookmarked(widget.imagePath);

    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return ContentsPopup();
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                if (isBookmarked) {
                  bookmarkModel.remove(widget.imagePath);
                } else {
                  bookmarkModel.add(widget.imagePath);
                }
              },
              child: Image.asset(
                isBookmarked
                    ? 'assets/images/bookmark_color.png'
                    : 'assets/images/bookmark.png',
                width: 48,
                height: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
