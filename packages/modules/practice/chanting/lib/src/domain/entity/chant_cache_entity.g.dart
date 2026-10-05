// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chant_cache_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantCacheEntity _$ChantCacheEntityFromJson(Map<String, dynamic> json) =>
    _ChantCacheEntity(
      id: json['id'] as String,
      contentId: json['contentId'] as String,
      assetType: $enumDecode(_$CachedAssetTypeEnumMap, json['assetType']),
      storagePath: json['storagePath'] as String,
      localFilePath: json['localFilePath'] as String,
      cachedVersion: (json['cachedVersion'] as num).toInt(),
      remoteUpdatedAtEpochMs: (json['remoteUpdatedAtEpochMs'] as num).toInt(),
      remoteHash: json['remoteHash'] as String?,
      remoteBytes: (json['remoteBytes'] as num?)?.toInt(),
      isValid: json['isValid'] as bool? ?? false,
      downloadState:
          $enumDecodeNullable(
            _$CacheDownloadStateEnumMap,
            json['downloadState'],
          ) ??
          CacheDownloadState.pending,
      failureCount: (json['failureCount'] as num?)?.toInt() ?? 0,
      lastError: json['lastError'] as String?,
      lastValidatedAtEpochMs: (json['lastValidatedAtEpochMs'] as num?)?.toInt(),
      createdAtEpochMs: (json['createdAtEpochMs'] as num).toInt(),
      updatedAtEpochMs: (json['updatedAtEpochMs'] as num).toInt(),
    );

Map<String, dynamic> _$ChantCacheEntityToJson(_ChantCacheEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contentId': instance.contentId,
      'assetType': _$CachedAssetTypeEnumMap[instance.assetType]!,
      'storagePath': instance.storagePath,
      'localFilePath': instance.localFilePath,
      'cachedVersion': instance.cachedVersion,
      'remoteUpdatedAtEpochMs': instance.remoteUpdatedAtEpochMs,
      'remoteHash': instance.remoteHash,
      'remoteBytes': instance.remoteBytes,
      'isValid': instance.isValid,
      'downloadState': _$CacheDownloadStateEnumMap[instance.downloadState]!,
      'failureCount': instance.failureCount,
      'lastError': instance.lastError,
      'lastValidatedAtEpochMs': instance.lastValidatedAtEpochMs,
      'createdAtEpochMs': instance.createdAtEpochMs,
      'updatedAtEpochMs': instance.updatedAtEpochMs,
    };

const _$CachedAssetTypeEnumMap = {
  CachedAssetType.audio: 'audio',
  CachedAssetType.lyrics: 'lyrics',
  CachedAssetType.cover: 'cover',
};

const _$CacheDownloadStateEnumMap = {
  CacheDownloadState.pending: 'pending',
  CacheDownloadState.downloading: 'downloading',
  CacheDownloadState.complete: 'complete',
  CacheDownloadState.failed: 'failed',
};
