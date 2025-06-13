// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_query_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionQueryOptions _$SessionQueryOptionsFromJson(Map<String, dynamic> json) =>
    _SessionQueryOptions(
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$SessionQueryOptionsToJson(
        _SessionQueryOptions instance) =>
    <String, dynamic>{
      'limit': instance.limit,
    };
