// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultModelImpl _$$ResultModelImplFromJson(Map<String, dynamic> json) =>
    _$ResultModelImpl(
      markId: (json['markId'] as num?)?.toInt() ?? 0,
      enText: json['enText'] as String? ?? "",
      end: json['end'] as bool? ?? false,
    );

Map<String, dynamic> _$$ResultModelImplToJson(_$ResultModelImpl instance) =>
    <String, dynamic>{
      'markId': instance.markId,
      'enText': instance.enText,
      'end': instance.end,
    };
