// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookmarkModel _$BookmarkModelFromJson(Map<String, dynamic> json) {
  return _BookmarkModel.fromJson(json);
}

/// @nodoc
mixin _$BookmarkModel {
  String get chatId => throw _privateConstructorUsedError;
  String get koText => throw _privateConstructorUsedError;
  String get enText => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get voiceFile => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get voiceId => throw _privateConstructorUsedError;
  String get describe => throw _privateConstructorUsedError;

  /// Serializes this BookmarkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkModelCopyWith<BookmarkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkModelCopyWith<$Res> {
  factory $BookmarkModelCopyWith(
          BookmarkModel value, $Res Function(BookmarkModel) then) =
      _$BookmarkModelCopyWithImpl<$Res, BookmarkModel>;
  @useResult
  $Res call(
      {String chatId,
      String koText,
      String enText,
      @Uint8ListConverter() Uint8List? voiceFile,
      String timestamp,
      String image,
      String name,
      int voiceId,
      String describe});
}

/// @nodoc
class _$BookmarkModelCopyWithImpl<$Res, $Val extends BookmarkModel>
    implements $BookmarkModelCopyWith<$Res> {
  _$BookmarkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? koText = null,
    Object? enText = null,
    Object? voiceFile = freezed,
    Object? timestamp = null,
    Object? image = null,
    Object? name = null,
    Object? voiceId = null,
    Object? describe = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      koText: null == koText
          ? _value.koText
          : koText // ignore: cast_nullable_to_non_nullable
              as String,
      enText: null == enText
          ? _value.enText
          : enText // ignore: cast_nullable_to_non_nullable
              as String,
      voiceFile: freezed == voiceFile
          ? _value.voiceFile
          : voiceFile // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      voiceId: null == voiceId
          ? _value.voiceId
          : voiceId // ignore: cast_nullable_to_non_nullable
              as int,
      describe: null == describe
          ? _value.describe
          : describe // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkModelImplCopyWith<$Res>
    implements $BookmarkModelCopyWith<$Res> {
  factory _$$BookmarkModelImplCopyWith(
          _$BookmarkModelImpl value, $Res Function(_$BookmarkModelImpl) then) =
      __$$BookmarkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatId,
      String koText,
      String enText,
      @Uint8ListConverter() Uint8List? voiceFile,
      String timestamp,
      String image,
      String name,
      int voiceId,
      String describe});
}

/// @nodoc
class __$$BookmarkModelImplCopyWithImpl<$Res>
    extends _$BookmarkModelCopyWithImpl<$Res, _$BookmarkModelImpl>
    implements _$$BookmarkModelImplCopyWith<$Res> {
  __$$BookmarkModelImplCopyWithImpl(
      _$BookmarkModelImpl _value, $Res Function(_$BookmarkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? koText = null,
    Object? enText = null,
    Object? voiceFile = freezed,
    Object? timestamp = null,
    Object? image = null,
    Object? name = null,
    Object? voiceId = null,
    Object? describe = null,
  }) {
    return _then(_$BookmarkModelImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      koText: null == koText
          ? _value.koText
          : koText // ignore: cast_nullable_to_non_nullable
              as String,
      enText: null == enText
          ? _value.enText
          : enText // ignore: cast_nullable_to_non_nullable
              as String,
      voiceFile: freezed == voiceFile
          ? _value.voiceFile
          : voiceFile // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      voiceId: null == voiceId
          ? _value.voiceId
          : voiceId // ignore: cast_nullable_to_non_nullable
              as int,
      describe: null == describe
          ? _value.describe
          : describe // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkModelImpl implements _BookmarkModel {
  const _$BookmarkModelImpl(
      {this.chatId = '',
      this.koText = '',
      this.enText = '',
      @Uint8ListConverter() this.voiceFile,
      this.timestamp = '',
      this.image = '',
      this.name = '',
      this.voiceId = 0,
      this.describe = ''});

  factory _$BookmarkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkModelImplFromJson(json);

  @override
  @JsonKey()
  final String chatId;
  @override
  @JsonKey()
  final String koText;
  @override
  @JsonKey()
  final String enText;
  @override
  @Uint8ListConverter()
  final Uint8List? voiceFile;
  @override
  @JsonKey()
  final String timestamp;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int voiceId;
  @override
  @JsonKey()
  final String describe;

  @override
  String toString() {
    return 'BookmarkModel(chatId: $chatId, koText: $koText, enText: $enText, voiceFile: $voiceFile, timestamp: $timestamp, image: $image, name: $name, voiceId: $voiceId, describe: $describe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkModelImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.koText, koText) || other.koText == koText) &&
            (identical(other.enText, enText) || other.enText == enText) &&
            const DeepCollectionEquality().equals(other.voiceFile, voiceFile) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.voiceId, voiceId) || other.voiceId == voiceId) &&
            (identical(other.describe, describe) ||
                other.describe == describe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatId,
      koText,
      enText,
      const DeepCollectionEquality().hash(voiceFile),
      timestamp,
      image,
      name,
      voiceId,
      describe);

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkModelImplCopyWith<_$BookmarkModelImpl> get copyWith =>
      __$$BookmarkModelImplCopyWithImpl<_$BookmarkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkModelImplToJson(
      this,
    );
  }
}

abstract class _BookmarkModel implements BookmarkModel {
  const factory _BookmarkModel(
      {final String chatId,
      final String koText,
      final String enText,
      @Uint8ListConverter() final Uint8List? voiceFile,
      final String timestamp,
      final String image,
      final String name,
      final int voiceId,
      final String describe}) = _$BookmarkModelImpl;

  factory _BookmarkModel.fromJson(Map<String, dynamic> json) =
      _$BookmarkModelImpl.fromJson;

  @override
  String get chatId;
  @override
  String get koText;
  @override
  String get enText;
  @override
  @Uint8ListConverter()
  Uint8List? get voiceFile;
  @override
  String get timestamp;
  @override
  String get image;
  @override
  String get name;
  @override
  int get voiceId;
  @override
  String get describe;

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkModelImplCopyWith<_$BookmarkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}