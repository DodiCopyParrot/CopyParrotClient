import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';
part 'bookmark_model.g.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) => base64Decode(json);

  @override
  String toJson(Uint8List object) => base64Encode(object);
}

@freezed
class BookmarkModel with _$BookmarkModel {
  const factory BookmarkModel({
    @Default('') String chatId,
    @Default('') String koText,
    @Default('') String enText,
    @Uint8ListConverter() Uint8List? voiceFile,
    @Default('') String timestamp,
    @Default('') String image,
    @Default('') String name,
    @Default(0) int voiceId,
    @Default('') String describe,
  }) = _BookmarkModel;

  factory BookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkModelFromJson(json);
}
