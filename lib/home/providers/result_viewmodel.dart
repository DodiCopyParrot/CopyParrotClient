import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/person_model.dart';
import '../../models/result_model.dart';

part 'result_viewmodel.g.dart';
// part 'result_viewmodel.freezed.dart';

@riverpod
class ResultViewModel extends _$ResultViewModel {
  final _dio = Dio();
  var deviceInfo = DeviceInfoPlugin();

  @override
  Stream<ResultModel> build({required String text}) async* {
    var iosInfo = await deviceInfo.iosInfo;

    ResultModel resultModel = ResultModel();

    final uri = Uri.https(
      "parrot.dopaminedefense.team",
      '/shadowing',
    );
    Response<ResponseBody> response = await _dio.postUri(uri,
        data: {'uuid': iosInfo.identifierForVendor, "koText": text},
        options: Options(responseType: ResponseType.stream));
    await for (final data in response.data!.stream) {
      final decodedData = utf8.decode(data);
      print("decodedData${decodedData}");
      var jsonString = "";
      var jsonData;
      try {
        if (decodedData.startsWith('data:')) {
          jsonString = decodedData.replaceFirst('data:', '').trim();
          if (jsonString == "") continue;
          jsonData = json.decode(jsonString);
        } else {
          jsonString = decodedData;
          if (jsonString == "") continue;
          jsonData = json.decode(jsonString);
        }
      } catch (e) {
        print("파싱에러");
      }

      if (jsonData == null) continue;
      ResultModel resultRes = ResultModel.fromJson(jsonData);

      if (resultRes.enText == "<END>") {
        resultModel = ResultModel(
          markId: resultRes.markId,
          enText: resultModel.enText,
          end: true,
        );
        yield resultModel;
        break;
      } else {
        resultModel = ResultModel(
          markId: resultRes.markId,
          enText: resultModel.enText + resultRes.enText,
        );
        yield resultModel;
      }
    }
  }
}

StreamTransformer<Uint8List, List<int>> unit8Transformer =
    StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    sink.add(List<int>.from(data));
  },
);

@riverpod
class ResultVoiceViewmodel extends _$ResultVoiceViewmodel {
  final _dio = Dio();
  @override
  Future<Uint8List> build(
      {required String text, required int markId, required int voiceId}) async {
    final uri = Uri.https(
      "parrot.dopaminedefense.team",
      '/shadowing/generate-voice',
    );
    final response = await _dio.postUri(uri,
        data: {"markId": markId, "voiceId": voiceId, "enText": text},
        options: Options(responseType: ResponseType.bytes)
        // options: Options(
        //   headers: {
        //     'Content-Length': "500",
        //     'Content-Type': 'application/json', // Content-Type도 설정
        //   },
        // ),
        );

    Uint8List fileData = Uint8List.fromList(response.data);
    // // 임시 파일로 저장합니다.
    // final tempDir = await Directory.systemTemp.createTemp();
    // final filePath = '${tempDir.path}/${markId}_audio.mp3';
    // final file = File(filePath);
    // await file.writeAsBytes(fileData);
    // // PlayerController controller = PlayerController(); // Initialise
    //
    // // await controller.preparePlayer(
    // //   path: filePath,
    // //   shouldExtractWaveform: true,
    // //   volume: 1,
    // // );

    return fileData;
  }
}

List<int> parseStringToIntList(String str) {
  // JSON 형식으로 파싱하여 List<int>로 변환
  return List<int>.from(json.decode(str));
}

// @riverpod
// class BookmarkViewmodel extends _$BookmarkViewmodel {
//   @override
//   Future<Uint8List> build() async {}
// }

@riverpod
Future<List<PersonModel>> personList(Ref ref) async {
  final _dio = Dio();

  final uri = Uri.https(
    "parrot.dopaminedefense.team",
    '/influencer',
  );

  final response = await _dio.getUri(
    uri,
  );

  final List<PersonModel> personList = (response.data["data"] as List)
      .map((json) => PersonModel.fromJson(json))
      .toList();

  return personList;
}

// List<PersonModel> parsePersonModels(String jsonString) {
//   // JSON 문자열을 디코딩하여 List<dynamic>으로 변환
//   final List<dynamic> jsonList = json.decode(jsonString);
//
//   // 각 JSON 객체를 PersonModel로 변환하고 리스트로 만듦
//   return jsonList.map((json) => PersonModel.fromJson(json)).toList();
// }
