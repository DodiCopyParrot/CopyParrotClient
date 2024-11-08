import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

    final uri = Uri.http(
      "semtle.catholic.ac.kr:8087",
      '/shadowing',
    );
    Response<ResponseBody> response = await _dio.postUri(uri,
        data: {'uuid': iosInfo.identifierForVendor, "koText": text},
        options: Options(responseType: ResponseType.stream));
    await for (final data in response.data!.stream) {
      final decodedData = utf8.decode(data);
      print(decodedData);
      if (!decodedData.startsWith('data:')) {
        // 'data:' 부분을 제거하고 JSON 데이터만 추출
        if (decodedData.isNotEmpty || decodedData != "") {
          try {
            final jsonData = json.decode(decodedData);
            ResultModel resultRes = ResultModel.fromJson(jsonData);
            resultModel = ResultModel(
              markId: resultRes.markId,
              enText: resultModel.enText + resultRes.enText,
              end: resultRes.end,
            );
            yield resultModel;
          } catch (e) {
            print('JSON 파싱 오류: $e');
          }
        } else {
          yield resultModel;
        }
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
    final uri = Uri.http(
      "semtle.catholic.ac.kr:8087",
      '/shadowing/generate-voice',
    );
    final response = await _dio.postUri(uri,
        data: {"markId": markId, "voiceId": voiceId, "enText": text},
        options: Options());

    print(response.data);
    Uint8List fileData = Uint8List.fromList(response.data);

    return fileData;
  }
}
