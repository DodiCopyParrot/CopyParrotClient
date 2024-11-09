import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration = Duration();
  Duration _position = Duration();

  // PlayerController controller = PlayerController(); // Initialise
  bool selected = false;
  @override
  void dispose() {
    // Release all sources and dispose the player.
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });
  }

  String get _remainingTime {
    final remaining = _duration - _position;
    return '${remaining.inMinutes}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final stream = ref.watch(resultViewModelProvider(text: widget.text));
    var fileData = AsyncValue.loading();

    print(stream.value);
    if (stream.hasValue && stream.value!.end) {
      fileData = ref.watch(resultVoiceViewmodelProvider(
        text: stream.value!.enText,
        markId: stream.value!.markId,
        voiceId: widget.person.voiceId,
      ));
    }

    if (fileData.hasValue && audioPlayer.source == null) {
      audioPlayer.setSourceBytes(fileData.value!, mimeType: 'audio/mpeg');
    }
    // print(controllerResult);
    // if (controllerResult.hasValue) {
    //   print(controllerResult.value!);
    //   setState(() {
    //     controller = controllerResult.value!;
    //   });
    // }
    // print(path);
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
                            "${widget.person.name} 라면 이렇게 말해요.",
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
                      SizedBox(
                        height: 11,
                      ),
                      if (stream.hasValue && stream.value!.end)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (!fileData.hasValue) return;
                                if (audioPlayer.state == PlayerState.playing) {
                                  await audioPlayer.pause();
                                } else {
                                  await audioPlayer.resume();
                                }
                              },
                              child: Container(
                                width: 139,
                                height: 37,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      audioPlayer.source == null
                                          ? SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color: Color(0xff375FFF),
                                                strokeWidth: 1,
                                              ),
                                            )
                                          : Row(
                                              children: [
                                                Icon(
                                                  audioPlayer.state ==
                                                          PlayerState.playing
                                                      ? Icons.pause
                                                      : Icons.play_arrow,
                                                  size: 16,
                                                  color: Color(0xff375FFF),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "${_remainingTime}",
                                                  style:
                                                      semiBold18Black.copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xff375FFF),
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
                            SizedBox(
                              width: 11,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = true;
                                });
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              253,
                                          padding: EdgeInsets.only(
                                              left: 20, bottom: 60, right: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(30))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/rect.png",
                                                    width: 50,
                                                  ),
                                                  SizedBox(
                                                    height: 26,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/bottom-sheet.png",
                                                    width: 350,
                                                  ),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 52,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color(0xffDCFF48),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "설정하기",
                                                      style:
                                                          boldWhite20.copyWith(
                                                              color: Color(
                                                                  0xff111013),
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                    });
                              },
                              child: Image.asset(
                                "assets/images/bookmark-${selected ? "on" : "off"}.png",
                                width: 37,
                              ),
                            )
                          ],
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
