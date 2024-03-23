import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bookmark_model.dart';
import 'bookmarked_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'contents_popup.dart';
import 'buildRecycleButtons.dart';
import 'recycle_title.dart';

class BookmarkedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookmarkedImages = Provider.of<BookmarkModel>(context).bookmarkedImages;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BookMarkAppBar.buildAppBar(context),
      body: Column(
        children: [
          RecycleTitle(),
          RecycleButtons(),
          SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16), // Apply horizontal padding
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: bookmarkedImages.length,
                itemBuilder: (context, index) {
                  String imagePath = bookmarkedImages[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ContentsPopup();
                        },
                      );
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal:
                                  2.0), // Adjusted padding for consistency
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<BookmarkModel>(context, listen: false)
                                  .remove(imagePath);
                            },
                            child: Image.asset(
                              'assets/images/bookmark_color.png',
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
