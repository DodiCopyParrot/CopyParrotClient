import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.g.dart';
part 'result_model.freezed.dart';

@freezed
class ResultModel with _$ResultModel {
  const factory ResultModel({
    @Default(0) int markId,
    @Default("") String enText,
    @Default(false) bool end,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}
