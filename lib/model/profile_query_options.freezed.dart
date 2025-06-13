// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileQueryOptions implements DiagnosticableTreeMixin {
  int get limit;

  /// Create a copy of ProfileQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileQueryOptionsCopyWith<ProfileQueryOptions> get copyWith =>
      _$ProfileQueryOptionsCopyWithImpl<ProfileQueryOptions>(
          this as ProfileQueryOptions, _$identity);

  /// Serializes this ProfileQueryOptions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProfileQueryOptions'))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileQueryOptions &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileQueryOptions(limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $ProfileQueryOptionsCopyWith<$Res> {
  factory $ProfileQueryOptionsCopyWith(
          ProfileQueryOptions value, $Res Function(ProfileQueryOptions) _then) =
      _$ProfileQueryOptionsCopyWithImpl;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$ProfileQueryOptionsCopyWithImpl<$Res>
    implements $ProfileQueryOptionsCopyWith<$Res> {
  _$ProfileQueryOptionsCopyWithImpl(this._self, this._then);

  final ProfileQueryOptions _self;
  final $Res Function(ProfileQueryOptions) _then;

  /// Create a copy of ProfileQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_self.copyWith(
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileQueryOptions extends ProfileQueryOptions
    with DiagnosticableTreeMixin {
  const _ProfileQueryOptions({this.limit = 20}) : super._();
  factory _ProfileQueryOptions.fromJson(Map<String, dynamic> json) =>
      _$ProfileQueryOptionsFromJson(json);

  @override
  @JsonKey()
  final int limit;

  /// Create a copy of ProfileQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileQueryOptionsCopyWith<_ProfileQueryOptions> get copyWith =>
      __$ProfileQueryOptionsCopyWithImpl<_ProfileQueryOptions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileQueryOptionsToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ProfileQueryOptions'))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileQueryOptions &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileQueryOptions(limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$ProfileQueryOptionsCopyWith<$Res>
    implements $ProfileQueryOptionsCopyWith<$Res> {
  factory _$ProfileQueryOptionsCopyWith(_ProfileQueryOptions value,
          $Res Function(_ProfileQueryOptions) _then) =
      __$ProfileQueryOptionsCopyWithImpl;
  @override
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$ProfileQueryOptionsCopyWithImpl<$Res>
    implements _$ProfileQueryOptionsCopyWith<$Res> {
  __$ProfileQueryOptionsCopyWithImpl(this._self, this._then);

  final _ProfileQueryOptions _self;
  final $Res Function(_ProfileQueryOptions) _then;

  /// Create a copy of ProfileQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? limit = null,
  }) {
    return _then(_ProfileQueryOptions(
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
