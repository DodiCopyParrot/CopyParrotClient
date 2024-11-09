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
    );

Map<String, dynamic> _$$PersonModelImplToJson(_$PersonModelImpl instance) =>
    <String, dynamic>{
      'voiceId': instance.voiceId,
      'describe': instance.describe,
      'image': instance.image,
      'name': instance.name,
      'enName': instance.enName,
    };
