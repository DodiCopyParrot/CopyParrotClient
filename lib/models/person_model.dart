// "voiceId": "",
// "describe":"", // 인물 목소리 특성
// "image":"", // 인물 이미지 링크
// "name":"", //인물 이름
// "voiceFile": ~ //예시 음성 파일

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'person_model.freezed.dart';
part 'person_model.g.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) => base64Decode(json);

  @override
  String toJson(Uint8List object) => base64Encode(object);
}

@freezed
class PersonModel with _$PersonModel {
  const factory PersonModel({
    @Default(0) int voiceId,
    @Default('') String context,
    @Default('') String image,
    @Default('') String koName,
    @Default("") String name,
    // @Uint8ListConverter() Uint8List? voiceFile,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
