// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonModelImpl _$$PersonModelImplFromJson(Map<String, dynamic> json) =>
    _$PersonModelImpl(
      voiceId: (json['voiceId'] as num?)?.toInt() ?? 0,
      context: json['context'] as String? ?? '',
      image: json['image'] as String? ?? '',
      koName: json['koName'] as String? ?? '',
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$$PersonModelImplToJson(_$PersonModelImpl instance) =>
    <String, dynamic>{
      'voiceId': instance.voiceId,
      'context': instance.context,
      'image': instance.image,
      'koName': instance.koName,
      'name': instance.name,
    };
