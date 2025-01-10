// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PresenceQueryOptions _$PresenceQueryOptionsFromJson(Map<String, dynamic> json) {
  return _PresenceQueryOptions.fromJson(json);
}

/// @nodoc
mixin _$PresenceQueryOptions {
  Duration get windowSize => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String? get ownProfileId => throw _privateConstructorUsedError;
  String? get lastDocumentId => throw _privateConstructorUsedError;

  /// Serializes this PresenceQueryOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PresenceQueryOptionsCopyWith<PresenceQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceQueryOptionsCopyWith<$Res> {
  factory $PresenceQueryOptionsCopyWith(PresenceQueryOptions value,
          $Res Function(PresenceQueryOptions) then) =
      _$PresenceQueryOptionsCopyWithImpl<$Res, PresenceQueryOptions>;
  @useResult
  $Res call(
      {Duration windowSize,
      int limit,
      String? ownProfileId,
      String? lastDocumentId});
}

/// @nodoc
class _$PresenceQueryOptionsCopyWithImpl<$Res,
        $Val extends PresenceQueryOptions>
    implements $PresenceQueryOptionsCopyWith<$Res> {
  _$PresenceQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windowSize = null,
    Object? limit = null,
    Object? ownProfileId = freezed,
    Object? lastDocumentId = freezed,
  }) {
    return _then(_value.copyWith(
      windowSize: null == windowSize
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as Duration,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      ownProfileId: freezed == ownProfileId
          ? _value.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDocumentId: freezed == lastDocumentId
          ? _value.lastDocumentId
          : lastDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresenceQueryOptionsImplCopyWith<$Res>
    implements $PresenceQueryOptionsCopyWith<$Res> {
  factory _$$PresenceQueryOptionsImplCopyWith(_$PresenceQueryOptionsImpl value,
          $Res Function(_$PresenceQueryOptionsImpl) then) =
      __$$PresenceQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration windowSize,
      int limit,
      String? ownProfileId,
      String? lastDocumentId});
}

/// @nodoc
class __$$PresenceQueryOptionsImplCopyWithImpl<$Res>
    extends _$PresenceQueryOptionsCopyWithImpl<$Res, _$PresenceQueryOptionsImpl>
    implements _$$PresenceQueryOptionsImplCopyWith<$Res> {
  __$$PresenceQueryOptionsImplCopyWithImpl(_$PresenceQueryOptionsImpl _value,
      $Res Function(_$PresenceQueryOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windowSize = null,
    Object? limit = null,
    Object? ownProfileId = freezed,
    Object? lastDocumentId = freezed,
  }) {
    return _then(_$PresenceQueryOptionsImpl(
      windowSize: null == windowSize
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as Duration,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      ownProfileId: freezed == ownProfileId
          ? _value.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDocumentId: freezed == lastDocumentId
          ? _value.lastDocumentId
          : lastDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceQueryOptionsImpl extends _PresenceQueryOptions
    with DiagnosticableTreeMixin {
  const _$PresenceQueryOptionsImpl(
      {this.windowSize = const Duration(hours: 3),
      this.limit = 20,
      this.ownProfileId,
      this.lastDocumentId})
      : super._();

  factory _$PresenceQueryOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceQueryOptionsImplFromJson(json);

  @override
  @JsonKey()
  final Duration windowSize;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? ownProfileId;
  @override
  final String? lastDocumentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PresenceQueryOptions(windowSize: $windowSize, limit: $limit, ownProfileId: $ownProfileId, lastDocumentId: $lastDocumentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PresenceQueryOptions'))
      ..add(DiagnosticsProperty('windowSize', windowSize))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('ownProfileId', ownProfileId))
      ..add(DiagnosticsProperty('lastDocumentId', lastDocumentId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceQueryOptionsImpl &&
            (identical(other.windowSize, windowSize) ||
                other.windowSize == windowSize) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.ownProfileId, ownProfileId) ||
                other.ownProfileId == ownProfileId) &&
            (identical(other.lastDocumentId, lastDocumentId) ||
                other.lastDocumentId == lastDocumentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, windowSize, limit, ownProfileId, lastDocumentId);

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceQueryOptionsImplCopyWith<_$PresenceQueryOptionsImpl>
      get copyWith =>
          __$$PresenceQueryOptionsImplCopyWithImpl<_$PresenceQueryOptionsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceQueryOptionsImplToJson(
      this,
    );
  }
}

abstract class _PresenceQueryOptions extends PresenceQueryOptions {
  const factory _PresenceQueryOptions(
      {final Duration windowSize,
      final int limit,
      final String? ownProfileId,
      final String? lastDocumentId}) = _$PresenceQueryOptionsImpl;
  const _PresenceQueryOptions._() : super._();

  factory _PresenceQueryOptions.fromJson(Map<String, dynamic> json) =
      _$PresenceQueryOptionsImpl.fromJson;

  @override
  Duration get windowSize;
  @override
  int get limit;
  @override
  String? get ownProfileId;
  @override
  String? get lastDocumentId;

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenceQueryOptionsImplCopyWith<_$PresenceQueryOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
