// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resultViewModelHash() => r'bc6488e95fc010f2586374a308fb26f4c8a426df';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ResultViewModel
    extends BuildlessAutoDisposeStreamNotifier<ResultModel> {
  late final String text;

  Stream<ResultModel> build({
    required String text,
  });
}

/// See also [ResultViewModel].
@ProviderFor(ResultViewModel)
const resultViewModelProvider = ResultViewModelFamily();

/// See also [ResultViewModel].
class ResultViewModelFamily extends Family<AsyncValue<ResultModel>> {
  /// See also [ResultViewModel].
  const ResultViewModelFamily();

  /// See also [ResultViewModel].
  ResultViewModelProvider call({
    required String text,
  }) {
    return ResultViewModelProvider(
      text: text,
    );
  }

  @override
  ResultViewModelProvider getProviderOverride(
    covariant ResultViewModelProvider provider,
  ) {
    return call(
      text: provider.text,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'resultViewModelProvider';
}

/// See also [ResultViewModel].
class ResultViewModelProvider extends AutoDisposeStreamNotifierProviderImpl<
    ResultViewModel, ResultModel> {
  /// See also [ResultViewModel].
  ResultViewModelProvider({
    required String text,
  }) : this._internal(
          () => ResultViewModel()..text = text,
          from: resultViewModelProvider,
          name: r'resultViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultViewModelHash,
          dependencies: ResultViewModelFamily._dependencies,
          allTransitiveDependencies:
              ResultViewModelFamily._allTransitiveDependencies,
          text: text,
        );

  ResultViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  Stream<ResultModel> runNotifierBuild(
    covariant ResultViewModel notifier,
  ) {
    return notifier.build(
      text: text,
    );
  }

  @override
  Override overrideWith(ResultViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ResultViewModelProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<ResultViewModel, ResultModel>
      createElement() {
    return _ResultViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultViewModelProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ResultViewModelRef on AutoDisposeStreamNotifierProviderRef<ResultModel> {
  /// The parameter `text` of this provider.
  String get text;
}

class _ResultViewModelProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ResultViewModel,
        ResultModel> with ResultViewModelRef {
  _ResultViewModelProviderElement(super.provider);

  @override
  String get text => (origin as ResultViewModelProvider).text;
}

String _$resultVoiceViewmodelHash() =>
    r'da122808dd0b316d778afb053c66779484a52304';

abstract class _$ResultVoiceViewmodel
    extends BuildlessAutoDisposeAsyncNotifier<Uint8List> {
  late final String text;
  late final int markId;
  late final int voiceId;

  FutureOr<Uint8List> build({
    required String text,
    required int markId,
    required int voiceId,
  });
}

/// See also [ResultVoiceViewmodel].
@ProviderFor(ResultVoiceViewmodel)
const resultVoiceViewmodelProvider = ResultVoiceViewmodelFamily();

/// See also [ResultVoiceViewmodel].
class ResultVoiceViewmodelFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [ResultVoiceViewmodel].
  const ResultVoiceViewmodelFamily();

  /// See also [ResultVoiceViewmodel].
  ResultVoiceViewmodelProvider call({
    required String text,
    required int markId,
    required int voiceId,
  }) {
    return ResultVoiceViewmodelProvider(
      text: text,
      markId: markId,
      voiceId: voiceId,
    );
  }

  @override
  ResultVoiceViewmodelProvider getProviderOverride(
    covariant ResultVoiceViewmodelProvider provider,
  ) {
    return call(
      text: provider.text,
      markId: provider.markId,
      voiceId: provider.voiceId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'resultVoiceViewmodelProvider';
}

/// See also [ResultVoiceViewmodel].
class ResultVoiceViewmodelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ResultVoiceViewmodel, Uint8List> {
  /// See also [ResultVoiceViewmodel].
  ResultVoiceViewmodelProvider({
    required String text,
    required int markId,
    required int voiceId,
  }) : this._internal(
          () => ResultVoiceViewmodel()
            ..text = text
            ..markId = markId
            ..voiceId = voiceId,
          from: resultVoiceViewmodelProvider,
          name: r'resultVoiceViewmodelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultVoiceViewmodelHash,
          dependencies: ResultVoiceViewmodelFamily._dependencies,
          allTransitiveDependencies:
              ResultVoiceViewmodelFamily._allTransitiveDependencies,
          text: text,
          markId: markId,
          voiceId: voiceId,
        );

  ResultVoiceViewmodelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
    required this.markId,
    required this.voiceId,
  }) : super.internal();

  final String text;
  final int markId;
  final int voiceId;

  @override
  FutureOr<Uint8List> runNotifierBuild(
    covariant ResultVoiceViewmodel notifier,
  ) {
    return notifier.build(
      text: text,
      markId: markId,
      voiceId: voiceId,
    );
  }

  @override
  Override overrideWith(ResultVoiceViewmodel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ResultVoiceViewmodelProvider._internal(
        () => create()
          ..text = text
          ..markId = markId
          ..voiceId = voiceId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
        markId: markId,
        voiceId: voiceId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ResultVoiceViewmodel, Uint8List>
      createElement() {
    return _ResultVoiceViewmodelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultVoiceViewmodelProvider &&
        other.text == text &&
        other.markId == markId &&
        other.voiceId == voiceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);
    hash = _SystemHash.combine(hash, markId.hashCode);
    hash = _SystemHash.combine(hash, voiceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ResultVoiceViewmodelRef
    on AutoDisposeAsyncNotifierProviderRef<Uint8List> {
  /// The parameter `text` of this provider.
  String get text;

  /// The parameter `markId` of this provider.
  int get markId;

  /// The parameter `voiceId` of this provider.
  int get voiceId;
}

class _ResultVoiceViewmodelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ResultVoiceViewmodel,
        Uint8List> with ResultVoiceViewmodelRef {
  _ResultVoiceViewmodelProviderElement(super.provider);

  @override
  String get text => (origin as ResultVoiceViewmodelProvider).text;
  @override
  int get markId => (origin as ResultVoiceViewmodelProvider).markId;
  @override
  int get voiceId => (origin as ResultVoiceViewmodelProvider).voiceId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
