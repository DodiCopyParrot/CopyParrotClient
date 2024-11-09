// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) {
  return _PersonModel.fromJson(json);
}

/// @nodoc
mixin _$PersonModel {
  int get voiceId => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get koName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PersonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonModelCopyWith<PersonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonModelCopyWith<$Res> {
  factory $PersonModelCopyWith(
          PersonModel value, $Res Function(PersonModel) then) =
      _$PersonModelCopyWithImpl<$Res, PersonModel>;
  @useResult
  $Res call(
      {int voiceId, String context, String image, String koName, String name});
}

/// @nodoc
class _$PersonModelCopyWithImpl<$Res, $Val extends PersonModel>
    implements $PersonModelCopyWith<$Res> {
  _$PersonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voiceId = null,
    Object? context = null,
    Object? image = null,
    Object? koName = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      voiceId: null == voiceId
          ? _value.voiceId
          : voiceId // ignore: cast_nullable_to_non_nullable
              as int,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      koName: null == koName
          ? _value.koName
          : koName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonModelImplCopyWith<$Res>
    implements $PersonModelCopyWith<$Res> {
  factory _$$PersonModelImplCopyWith(
          _$PersonModelImpl value, $Res Function(_$PersonModelImpl) then) =
      __$$PersonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int voiceId, String context, String image, String koName, String name});
}

/// @nodoc
class __$$PersonModelImplCopyWithImpl<$Res>
    extends _$PersonModelCopyWithImpl<$Res, _$PersonModelImpl>
    implements _$$PersonModelImplCopyWith<$Res> {
  __$$PersonModelImplCopyWithImpl(
      _$PersonModelImpl _value, $Res Function(_$PersonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voiceId = null,
    Object? context = null,
    Object? image = null,
    Object? koName = null,
    Object? name = null,
  }) {
    return _then(_$PersonModelImpl(
      voiceId: null == voiceId
          ? _value.voiceId
          : voiceId // ignore: cast_nullable_to_non_nullable
              as int,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      koName: null == koName
          ? _value.koName
          : koName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonModelImpl implements _PersonModel {
  const _$PersonModelImpl(
      {this.voiceId = 0,
      this.context = '',
      this.image = '',
      this.koName = '',
      this.name = ""});

  factory _$PersonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonModelImplFromJson(json);

  @override
  @JsonKey()
  final int voiceId;
  @override
  @JsonKey()
  final String context;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String koName;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'PersonModel(voiceId: $voiceId, context: $context, image: $image, koName: $koName, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonModelImpl &&
            (identical(other.voiceId, voiceId) || other.voiceId == voiceId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.koName, koName) || other.koName == koName) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, voiceId, context, image, koName, name);

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonModelImplCopyWith<_$PersonModelImpl> get copyWith =>
      __$$PersonModelImplCopyWithImpl<_$PersonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonModelImplToJson(
      this,
    );
  }
}

abstract class _PersonModel implements PersonModel {
  const factory _PersonModel(
      {final int voiceId,
      final String context,
      final String image,
      final String koName,
      final String name}) = _$PersonModelImpl;

  factory _PersonModel.fromJson(Map<String, dynamic> json) =
      _$PersonModelImpl.fromJson;

  @override
  int get voiceId;
  @override
  String get context;
  @override
  String get image;
  @override
  String get koName;
  @override
  String get name;

  /// Create a copy of PersonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonModelImplCopyWith<_$PersonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
