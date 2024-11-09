// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkModelImpl _$$BookmarkModelImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      koText: json['koText'] as String? ?? '',
      enText: json['enText'] as String? ?? '',
      file: _$JsonConverterFromJson<String, Uint8List>(
          json['file'], const Uint8ListConverter().fromJson),
      timestamp: json['timestamp'] as String? ?? '',
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      voiceId: (json['voiceId'] as num?)?.toInt() ?? 0,
      describe: json['describe'] as String? ?? '',
    );

Map<String, dynamic> _$$BookmarkModelImplToJson(_$BookmarkModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'koText': instance.koText,
      'enText': instance.enText,
      'file': _$JsonConverterToJson<String, Uint8List>(
          instance.file, const Uint8ListConverter().toJson),
      'timestamp': instance.timestamp,
      'image': instance.image,
      'name': instance.name,
      'voiceId': instance.voiceId,
      'describe': instance.describe,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
