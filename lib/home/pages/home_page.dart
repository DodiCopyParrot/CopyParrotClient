import 'dart:async';
import 'dart:typed_data';

import 'package:copyparrot/home/pages/result_page.dart';
import 'package:copyparrot/home/providers/result_viewmodel.dart';
import 'package:copyparrot/models/person_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';

import '../../core/pallete.dart';
import '../../core/text_theme.dart';

class PersonBubble extends ConsumerWidget {
  const PersonBubble({super.key, required this.person});

  final PersonModel person;

  @override
  Widget build(BuildContext context, ref) {
    print(person);
    return GestureDetector(
      onTap: () {
        ref.read(mainHomeProvider.notifier).setPerson(voiceId: person.voiceId);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF3F2F8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                        width: 48,
                        height: 48,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: Image.network(
                            person.image,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        person.name,
                        style: semiBold18Black.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        person.context,
                        style: semiBold18Black.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Pallete.greyAColor),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(
                  "assets/images/icon_next.png",
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // TextEditingController 선언
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // 화면에서 사라질 때 controller를 해제하여 메모리 누수를 방지
    _controller.dispose();
    super.dispose();
  }

  late StreamSubscription _intentDataStreamSubscription;
  List<SharedFile>? list;

  @override
  void initState() {
    initSharingListener();

    super.initState();
  }

  initSharingListener() {
    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = FlutterSharingIntent.instance
        .getMediaStream()
        .listen((List<SharedFile> value) {
      setState(() {
        list = value;
        _controller.text = list?.join("\n\n") ?? "";
      });
      if (kDebugMode) {
        print(" Shared: getMediaStream ${value.map((f) => f.value).join(",")}");
      }
    }, onError: (err) {
      if (kDebugMode) {
        print("Shared: getIntentDataStream error: $err");
      }
    });

    // For sharing images coming from outside the app while the app is closed
    FlutterSharingIntent.instance
        .getInitialSharing()
        .then((List<SharedFile> value) {
      if (kDebugMode) {
        print(
            "Shared: getInitialMedia => ${value.map((f) => f.value).join(",")}");
      }
      setState(() {
        list = value;
        _controller.text = list?.join("\n\n") ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final persons = ref.watch(personListProvider);
    final myPerson = ref.watch(mainHomeProvider);

    PersonModel person = myPerson.hasValue ? myPerson.value! : PersonModel();
    // PersonModel(name: "오바마", enName: "Barack Obama", voiceId: 1);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 키보드 닫기
        },
        child: Container(
          decoration: BoxDecoration(
            image: myPerson.hasValue
                ? DecorationImage(
                    image: AssetImage(
                      "assets/images/background-${person.voiceId}.png",
                    ), // 경로에 맞게 수정
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter)
                : null,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset("assets/images/background-gradient.png"),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/background-blur.png",
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "copy parrot",
                            style: semiBold18Black,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 28,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff003670).withOpacity(0.15)),
                            child: Center(
                              child: Text(
                                person.koName,
                                style: boldWhite20.copyWith(
                                    fontSize: 14, color: Color(0xff003670)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await ref.read(personListProvider.future);
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              60,
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          bottom: 60,
                                          top: 30,
                                          right: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(30))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "완료",
                                                  style: mediumGrayA14.copyWith(
                                                      color: Color(0xff500AF4),
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            "워너비 변경",
                                            style: boldWhite20.copyWith(
                                              fontSize: 28,
                                              color: Color(0xff111115),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "닮고 싶은 워너비를 선택하여\n효과적으로 영어 실력을 향상시키세요.",
                                            style: mediumGrayA14,
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Image.asset(
                                            "assets/images/search-bar.png",
                                            width: 350,
                                            height: 44,
                                          ),
                                          Expanded(
                                            child: !persons.hasValue
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : ListView(
                                                    padding: EdgeInsets.only(
                                                        top: 40),
                                                    children: persons.value!
                                                        .map((val) =>
                                                            PersonBubble(
                                                                person: val))
                                                        .toList()),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Image.asset(
                                "assets/images/refresh.png",
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 41,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "오늘 당신이\n말하고 싶은 문장은?",
                              style: boldWhite24,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultPage(
                                              person: person,
                                              text: _controller.text,
                                            )));
                              },
                              child: Image.asset(
                                "assets/images/go.png",
                                width: 42,
                                height: 63,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "당신의 워너비, ${person.name} 가 대신 말해줄거예요.",
                          style: regularGrayA10.copyWith(
                              color: Color(0xffD1D1D1), fontSize: 11),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white, width: 1),
                              color: Colors.white.withOpacity(0.2)),
                          width: double.infinity,
                          // height: 42,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13.0, vertical: 11),
                            child: Center(
                              child: TextField(
                                maxLines: null,
                                controller: _controller,
                                style: regularGrayA10.copyWith(
                                    color: Colors.white, fontSize: 14),
                                decoration: InputDecoration.collapsed(
                                  hintText: "무엇을 말하고 싶나요?",
                                  hintStyle: regularGrayA10.copyWith(
                                      color: Colors.white, fontSize: 14),
                                ),
                                cursorColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Image.asset(
                          "assets/images/kakao-button.png",
                          width: 123,
                          height: 43,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Pallete.whiteColor,
//       appBar: AppBar(
//         surfaceTintColor: Pallete.whiteColor,
//         backgroundColor: Pallete.whiteColor,
//         //todo: 아이콘
//         title: Text(
//           "Copy Parrot",
//           style: semiBold18Black,
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 24.0),
//             child: Icon(
//               Icons.add,
//               size: 24,
//             ),
//           )
//         ],
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 36,
//               decoration: BoxDecoration(
//                 color: Pallete.lightBlueCardColor,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Icon(
//                     Icons.search,
//                     color: Pallete.greyAColor,
//                     size: 24,
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     "검색",
//                     style: semiBold14Grey,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   FriendBubble(
//                       person: PersonModel(
//                           image:
//                               "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRy5QMODyHm-LaMpgXOqMIUHPbQ-Y51jAZR_UJYC-9Dv1IL3ovh",
//                           name: "일론 머스크",
//                           describe: "남아공 출신 특유의 억양, 도전적이며 논리적"))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class FriendBubble extends StatelessWidget {
//   const FriendBubble({super.key, required this.person});
//
//   final PersonModel person;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//             useSafeArea: false,
//             context: context,
//             builder: (context) {
//               return Scaffold(
//                 backgroundColor: Pallete.whiteColor,
//                 body: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(person.image), // 이미지 파일 경로
//                           fit: BoxFit.cover, // 이미지를 컨테이너에 맞게 조정
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       color: Pallete.blackColor.withOpacity(0.2),
//                     ),
//                   ],
//                 ),
//               );
//             });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 56,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 56,
//                     height: 56,
//                     child: Center(
//                       child: Container(
//                         width: 48,
//                         height: 48,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16)),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.network(
//                             person.image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 12,
//                   ),
//                   Expanded(
//                       child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         person.name,
//                         style: semiBold14Black,
//                       ),
//                       SizedBox(
//                         height: 2,
//                       ),
//                       Text(
//                         person.describe,
//                         style: regular12Grey,
//                       )
//                     ],
//                   )),
//                 ],
//               ),
//             ),
//             Divider(
//               thickness: 1,
//               color: Pallete.greyBackgroundColor,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
