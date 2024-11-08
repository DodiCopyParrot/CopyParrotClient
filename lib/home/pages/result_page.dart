import 'package:copyparrot/core/text_theme.dart';
import 'package:copyparrot/home/providers/result_viewmodel.dart';
import 'package:copyparrot/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultPage extends ConsumerStatefulWidget {
  const ResultPage({super.key, required this.person, required this.text});

  final PersonModel person;
  final String text;

  @override
  ConsumerState createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final stream = ref.watch(resultViewModelProvider(text: widget.text));
    //print(stream);

    final file = ref.watch(resultVoiceViewmodelProvider(
      text:
          "This is the first part of the translation.\nThis is the second part.\nAnd here’s the final part of the translation.",
      markId: 2,
      voiceId: 2,
    ));
    print(file);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background-${widget.person.voiceId}.png",
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
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset(
                          "assets/images/icon_back.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    Text(
                      "결과",
                      style: semiboldWhite16.copyWith(
                          color: Color(0xff343434), fontSize: 20),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                  ],
                ),
                SizedBox(
                  height: 46,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "당신의 문장은",
                            style: regularGrayA10.copyWith(
                                color: Colors.white, fontSize: 11),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.white.withOpacity(0.2)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13.0, vertical: 11),
                          child: Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            maxLines: null,
                            widget.text,
                            style: regularGrayA10.copyWith(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.person.enName} 라면 이렇게 말해요.",
                            style: regularGrayA10.copyWith(
                                color: Colors.white, fontSize: 11),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 0.5,
                        width: double.infinity,
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        '"${stream.hasValue ? stream.value!.enText : ""}"',
                        style: TextStyle(
                            fontFamily: 'CrimsonText',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
