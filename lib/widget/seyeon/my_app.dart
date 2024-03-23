// main.dart

import 'package:flutter/material.dart';
import 'recycle_list.dart';
import 'study_appbar.dart';
import 'bookmarked.dart';
import 'RecyclePhotos.dart';
import 'buildRecycleButtons.dart';
import 'package:study_record_list/src/bookmarked.dart'; // Ensure BookmarkedPage import

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      home: Scaffold(
        appBar: StudyAppBar.buildAppBar(context),
        body: CustomScrollView(
          slivers: [
            RecycleButtons(),
          ],
        ),
      ),
      routes: {
        '/bookmarked': (context) => BookmarkedPage(),
      },
    );
  }
}
