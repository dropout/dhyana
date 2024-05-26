// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence_query_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenceQueryOptionsImpl _$$PresenceQueryOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$PresenceQueryOptionsImpl(
      windowSize: json['windowSize'] == null
          ? const Duration(hours: 3)
          : Duration(microseconds: (json['windowSize'] as num).toInt()),
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$PresenceQueryOptionsImplToJson(
        _$PresenceQueryOptionsImpl instance) =>
    <String, dynamic>{
      'windowSize': instance.windowSize.inMicroseconds,
      'limit': instance.limit,
    };
