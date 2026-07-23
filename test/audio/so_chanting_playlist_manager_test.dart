import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/so_chanting_playlist_manager.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant_asset_metadata.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant_local_resources.dart';
import 'package:dhyana/util/default_profile_data.dart';
import 'package:flutter_test/flutter_test.dart';

ChantLocalResources _resource({
  required String id,
  required String name,
  required String path,
  required Duration length,
}) {
  final chant = Chant(
    id: id,
    name: name,
    blurHash: DefaultProfileData.photoBlurhash,
    metaData: ChantMetaData(
      id: id,
      audioVersion: 1,
      lyricsVersion: 1,
      coverVersion: 1,
      audioSha256: 'audio',
      lyricsSha256: 'lyrics',
      coverSha256: 'cover',
      audioBytes: 1,
      lyricsBytes: 1,
      coverBytes: 1,
      updatedAt: DateTime(2026, 1, 1),
    ),
    length: length,
  );

  return ChantLocalResources(
    chant: chant,
    audioLocalPath: path,
    lyricsLocalPath: '$path.txt',
    audioVersion: 1,
    lyricsVersion: 1,
  );
}

void main() {
  group('SoChantingPlaylistManager', () {
    test('setup initializes the first entry and keeps index changes isolated', () async {
      var invalidationCount = 0;
      final manager = SoChantingPlaylistManager(
        onCurrentIndexChanged: () async {
          invalidationCount++;
        },
      );

      final first = SoChantingPlaylistEntry(
        source: _resource(
          id: 'chant-1',
          name: 'First',
          path: '/tmp/chant-1.m4a',
          length: const Duration(minutes: 1),
        ),
        mediaItem: const MediaItem(
          id: 'chant-1',
          title: 'First',
          duration: Duration(minutes: 1),
        ),
      );
      final second = SoChantingPlaylistEntry(
        source: _resource(
          id: 'chant-2',
          name: 'Second',
          path: '/tmp/chant-2.m4a',
          length: const Duration(minutes: 2),
        ),
        mediaItem: const MediaItem(
          id: 'chant-2',
          title: 'Second',
          duration: Duration(minutes: 2),
        ),
      );

      await manager.setup([first, second]);

      expect(manager.currentIndex, 0);
      expect(manager.currentEntry, first);
      expect(manager.currentMediaItem, first.mediaItem);
      expect(invalidationCount, 0);

      expect(manager.skipToNext(), completes);
      expect(manager.currentIndex, 1);
      expect(manager.currentEntry, second);
      expect(manager.currentMediaItem, second.mediaItem);
      expect(invalidationCount, 1);

      expect(manager.skipToPrevious(), completes);
      expect(manager.currentIndex, 0);
      expect(manager.currentEntry, first);
      expect(invalidationCount, 2);
    });

    test('clear resets the playlist and notifies invalidation after setup', () async {
      var invalidationCount = 0;
      final manager = SoChantingPlaylistManager(
        onCurrentIndexChanged: () async {
          invalidationCount++;
        },
      );

      await manager.setup([
        SoChantingPlaylistEntry(
          source: _resource(
            id: 'chant-1',
            name: 'First',
            path: '/tmp/chant-1.m4a',
            length: const Duration(minutes: 1),
          ),
          mediaItem: const MediaItem(
            id: 'chant-1',
            title: 'First',
            duration: Duration(minutes: 1),
          ),
        ),
      ]);

      await manager.clear();

      expect(manager.currentIndex, -1);
      expect(manager.currentEntry, isNull);
      expect(manager.currentMediaItem, isNull);
      expect(invalidationCount, 1);
    });

    test('skip methods fail at the boundaries without invalidation', () async {
      var invalidationCount = 0;
      final manager = SoChantingPlaylistManager(
        onCurrentIndexChanged: () async {
          invalidationCount++;
        },
      );

      await manager.setup([
        SoChantingPlaylistEntry(
          source: _resource(
            id: 'chant-1',
            name: 'First',
            path: '/tmp/chant-1.m4a',
            length: const Duration(minutes: 1),
          ),
          mediaItem: const MediaItem(
            id: 'chant-1',
            title: 'First',
            duration: Duration(minutes: 1),
          ),
        ),
      ]);

      expect(manager.skipToPrevious(), throwsStateError);
      expect(manager.skipToNext(), throwsStateError);
      expect(manager.currentIndex, 0);
      expect(invalidationCount, 0);
    });
  });
}
