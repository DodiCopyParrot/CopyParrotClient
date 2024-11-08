import 'package:copyparrot/core/text_theme.dart';
import 'package:flutter/material.dart';

import '../../core/pallete.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        surfaceTintColor: Pallete.whiteColor,
        backgroundColor: Pallete.whiteColor,
        // //todo: 아이콘
        // title: Text(
        //   "Copy Parrot",
        //   style: semiBold18Black,
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.add,
              size: 24,
            ),
          )
        ],
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
      ),
    );
  }
}
