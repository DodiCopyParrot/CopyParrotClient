// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonModelImpl _$$PersonModelImplFromJson(Map<String, dynamic> json) =>
    _$PersonModelImpl(
      voiceId: (json['voiceId'] as num?)?.toInt() ?? 0,
      describe: json['describe'] as String? ?? '',
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      enName: json['enName'] as String? ?? "",
      voiceFile: _$JsonConverterFromJson<String, Uint8List>(
          json['voiceFile'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$$PersonModelImplToJson(_$PersonModelImpl instance) =>
    <String, dynamic>{
      'voiceId': instance.voiceId,
      'describe': instance.describe,
      'image': instance.image,
      'name': instance.name,
      'enName': instance.enName,
      'voiceFile': _$JsonConverterToJson<String, Uint8List>(
          instance.voiceFile, const Uint8ListConverter().toJson),
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
