import 'dart:typed_data';

import 'package:copyparrot/home/pages/result_page.dart';
import 'package:copyparrot/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/pallete.dart';
import '../../core/text_theme.dart';

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

  @override
  Widget build(BuildContext context) {
    PersonModel person =
        PersonModel(name: "오바마", enName: "Barack Obama", voiceId: 1);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background-${person.voiceId}.png",
              ), // 경로에 맞게 수정
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
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
                              person.name,
                              style: boldWhite20.copyWith(
                                  fontSize: 14, color: Color(0xff003670)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Image.asset(
                            "assets/images/refresh.png",
                            width: 22,
                            height: 22,
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
                        "당신의 워너비, ${person.enName} 가 대신 말해줄거예요.",
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
