// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresenceQueryOptions implements DiagnosticableTreeMixin {
  Duration get windowSize;
  int get limit;
  String? get ownProfileId;
  String? get lastDocumentId;

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PresenceQueryOptionsCopyWith<PresenceQueryOptions> get copyWith =>
      _$PresenceQueryOptionsCopyWithImpl<PresenceQueryOptions>(
          this as PresenceQueryOptions, _$identity);

  /// Serializes this PresenceQueryOptions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is PresenceQueryOptions &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PresenceQueryOptions(windowSize: $windowSize, limit: $limit, ownProfileId: $ownProfileId, lastDocumentId: $lastDocumentId)';
  }
}

/// @nodoc
abstract mixin class $PresenceQueryOptionsCopyWith<$Res> {
  factory $PresenceQueryOptionsCopyWith(PresenceQueryOptions value,
          $Res Function(PresenceQueryOptions) _then) =
      _$PresenceQueryOptionsCopyWithImpl;
  @useResult
  $Res call(
      {Duration windowSize,
      int limit,
      String? ownProfileId,
      String? lastDocumentId});
}

/// @nodoc
class _$PresenceQueryOptionsCopyWithImpl<$Res>
    implements $PresenceQueryOptionsCopyWith<$Res> {
  _$PresenceQueryOptionsCopyWithImpl(this._self, this._then);

  final PresenceQueryOptions _self;
  final $Res Function(PresenceQueryOptions) _then;

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
    return _then(_self.copyWith(
      windowSize: null == windowSize
          ? _self.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as Duration,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      ownProfileId: freezed == ownProfileId
          ? _self.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDocumentId: freezed == lastDocumentId
          ? _self.lastDocumentId
          : lastDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PresenceQueryOptions extends PresenceQueryOptions
    with DiagnosticableTreeMixin {
  const _PresenceQueryOptions(
      {this.windowSize = const Duration(hours: 3),
      this.limit = 20,
      this.ownProfileId,
      this.lastDocumentId})
      : super._();
  factory _PresenceQueryOptions.fromJson(Map<String, dynamic> json) =>
      _$PresenceQueryOptionsFromJson(json);

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

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PresenceQueryOptionsCopyWith<_PresenceQueryOptions> get copyWith =>
      __$PresenceQueryOptionsCopyWithImpl<_PresenceQueryOptions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PresenceQueryOptionsToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _PresenceQueryOptions &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PresenceQueryOptions(windowSize: $windowSize, limit: $limit, ownProfileId: $ownProfileId, lastDocumentId: $lastDocumentId)';
  }
}

/// @nodoc
abstract mixin class _$PresenceQueryOptionsCopyWith<$Res>
    implements $PresenceQueryOptionsCopyWith<$Res> {
  factory _$PresenceQueryOptionsCopyWith(_PresenceQueryOptions value,
          $Res Function(_PresenceQueryOptions) _then) =
      __$PresenceQueryOptionsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Duration windowSize,
      int limit,
      String? ownProfileId,
      String? lastDocumentId});
}

/// @nodoc
class __$PresenceQueryOptionsCopyWithImpl<$Res>
    implements _$PresenceQueryOptionsCopyWith<$Res> {
  __$PresenceQueryOptionsCopyWithImpl(this._self, this._then);

  final _PresenceQueryOptions _self;
  final $Res Function(_PresenceQueryOptions) _then;

  /// Create a copy of PresenceQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? windowSize = null,
    Object? limit = null,
    Object? ownProfileId = freezed,
    Object? lastDocumentId = freezed,
  }) {
    return _then(_PresenceQueryOptions(
      windowSize: null == windowSize
          ? _self.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as Duration,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      ownProfileId: freezed == ownProfileId
          ? _self.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDocumentId: freezed == lastDocumentId
          ? _self.lastDocumentId
          : lastDocumentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
