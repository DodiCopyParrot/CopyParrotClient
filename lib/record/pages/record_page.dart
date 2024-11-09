import 'dart:typed_data';

import 'package:copyparrot/home/pages/result_page.dart';
import 'package:copyparrot/models/bookmark_model.dart';
import 'package:copyparrot/models/person_model.dart';
import 'package:copyparrot/record/providers/record_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/pallete.dart';
import '../../core/text_theme.dart';

List<BookmarkModel> filterUniqueVoiceIdBookmarks(
    List<BookmarkModel> bookmarks) {
  Map<int, BookmarkModel> uniqueBookmarks = {};

  for (var bookmark in bookmarks) {
    // 해당 voiceId가 아직 Map에 없으면 추가
    if (!uniqueBookmarks.containsKey(bookmark.voiceId)) {
      uniqueBookmarks[bookmark.voiceId] = bookmark;
    }
  }

  // Map의 값들을 리스트로 변환하여 반환
  return uniqueBookmarks.values.toList();
}

String getCurrentDateString() {
  DateTime now = DateTime.now();
  String formattedDate = '${now.year}년 ${now.month}월 ${now.day}일 오늘';
  return formattedDate;
}

class RecordPage extends ConsumerStatefulWidget {
  const RecordPage({super.key});

  @override
  ConsumerState createState() => _RecordPageState();
}

class _RecordPageState extends ConsumerState<RecordPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bookmarksProv =
        ref.watch(bookmarkViewModelProvider.notifier).fetchAllBookmarks();
    List<BookmarkModel> bookmarksList = [];
    bookmarksProv.then((bookmarks) {
      bookmarksList = bookmarks;
      print("bookmarks2: $bookmarksList");
    });
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 68.0),
            child: Column(
              children: [
                // 첫 번째 줄
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('기록',
                          style:
                              boldWhite24.copyWith(color: Pallete.blackColor))
                    ],
                  ),
                ),
                // 두 번째 줄
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 18),
                  child: SizedBox(
                    height: 74,
                    child: FutureBuilder<List<BookmarkModel>>(
                      future: bookmarksProv,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData) {
                          final bookmarks = snapshot.data!;
                          final real = [
                            BookmarkModel(),
                            ...filterUniqueVoiceIdBookmarks(bookmarks)
                          ];
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: real.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  // 첫 번째 아이템: 이미지
                                  return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Column(
                                        children: [
                                          // ProfileCircle(
                                          //   profileImageString: friend.image,
                                          //   width: 50,
                                          //   borderColor: Pallete.notiBarColor,
                                          //   borderWidth: 1,
                                          // ),
                                          Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      color:
                                                          Pallete.deepBlueColor,
                                                      width: 2), // 테두리 설정
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24) // 원형으로 설정
                                                  ),
                                              child: Center(
                                                  child: Image.asset(
                                                      'assets/images/all.png',
                                                      width: 30))),
                                          SizedBox(height: 6),
                                          Text('전체',
                                              style: mediumGrayA14.copyWith(
                                                  fontSize: 12)),
                                        ],
                                      ));
                                } else {
                                  // 북마크 아이템
                                  return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 48,
                                            height: 48,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(34),
                                              child: Image.network(
                                                real[index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6),
                                          Text(real[index].name,
                                              style: mediumGrayA14.copyWith(
                                                  fontSize: 12)),
                                        ],
                                      ));
                                }
                              });
                        } else {
                          return Center(child: Text("북마크가 없습니다"));
                        }
                      },
                    ),
                  ),
                ),
                // 세 번째 줄
                Divider(thickness: 0.5, color: Pallete.greyAColor),
                // 네 번째 줄
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 29, bottom: 18),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getCurrentDateString(),
                            style: regularGrayA10.copyWith(fontSize: 14))
                      ]),
                ),
                // 다섯 번째 줄
                Container(
                  // color: Colors.blueGrey,
                  height: screenHeight - 307 - 83,
                  // width: screenWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FutureBuilder<List<BookmarkModel>>(
                    future: bookmarksProv,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        final bookmarks = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero, // 기본 패딩 제거
                          scrollDirection: Axis.vertical,
                          itemCount: bookmarks.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 37),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 34,
                                              height: 34,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(34),
                                                child: Image.network(
                                                  bookmarks[index].image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 7),
                                            Text(bookmarks[index].name,
                                                style: regularGrayA10.copyWith(
                                                    fontSize: 12,
                                                    color: Pallete.blackColor)),
                                            SizedBox(width: 7),
                                            Text(bookmarks[index].timestamp,
                                                style: regularGrayA10.copyWith(
                                                    fontSize: 10))
                                          ],
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Image.asset(
                                                'assets/images/bookmark.png',
                                                width: 10)),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                              bottomRight: Radius.circular(16)),
                                          color: Pallete.lightBlueCardColor,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  left: BorderSide(
                                                      color:
                                                          Pallete.deepBlueColor,
                                                      width: 4),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                color:
                                                    Pallete.greyBackgroundColor,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("You",
                                                      style: semiboldWhite16
                                                          .copyWith(
                                                              fontSize: 10,
                                                              color: Pallete
                                                                  .deepBlueColor)),
                                                  SizedBox(height: 4),
                                                  Text(bookmarks[index].koText,
                                                      style: regularGrayA10
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: Pallete
                                                                  .blackColor)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(bookmarks[index].enText,
                                                style: regularGrayA10.copyWith(
                                                    fontSize: 14,
                                                    color: Pallete.blackColor)),
                                          ],
                                        )),
                                    SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: () async {
                                        //
                                        // if (!fileData.hasValue) return;
                                        // if (audioPlayer.state ==
                                        //     PlayerState.playing) {
                                        //   await audioPlayer.pause();
                                        // } else {
                                        //   await audioPlayer.resume();
                                        // }
                                      },
                                      child: Container(
                                        width: 139,
                                        height: 37,
                                        decoration: BoxDecoration(
                                            color: Color(0xffF7F7FC),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.play_arrow,
                                                    size: 16,
                                                    color: Color(0xff375FFF),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    "0:17",
                                                    style: semiBold18Black
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff375FFF),
                                                            fontSize: 10),
                                                  )
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/sound.png",
                                                width: 66,
                                                height: 21,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      } else {
                        return Center(child: Text("북마크가 없습니다"));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
