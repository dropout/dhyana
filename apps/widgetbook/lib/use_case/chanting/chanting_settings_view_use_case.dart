import 'dart:convert';

import 'package:chanting/chanting.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:stepstones_widgetbook/get_it_scope.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _chantNames = [
  'Thousand Eyes and Hands Sutra',
  'Heart Sutra (Korean)',
  'Great Dharani',
  'Great Dharani 3x',
];

final _fixtureChants = List<Chant>.generate(
  _chantNames.length,
  (index) => Chant(
    id: 'preview-chant-$index',
    name: _chantNames[index],
    order: index,
    blurHash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
    length: Duration(minutes: 3 + index, seconds: 15),
    metaData: ChantMetaData(
      id: 'preview-chant-$index',
      audioVersion: 1,
      lyricsVersion: 1,
      coverVersion: 1,
      audioSha256: '',
      lyricsSha256: '',
      coverSha256: '',
      audioBytes: 0,
      lyricsBytes: 0,
      coverBytes: 0,
      updatedAt: DateTime(2024),
    ),
  ),
);

class _FakeChantingPublicApi implements ChantingPublicApi {
  @override
  Future<List<Chant>> loadChants({bool preferCache = false}) async =>
      _fixtureChants;

  @override
  Stream<List<Chant>> get chantsStream => Stream.value(_fixtureChants);

  @override
  Future<void> clearCachedChants() async {}
}

class _InMemorySharedPreferencesService implements SharedPreferencesService {
  final Map<String, Object?> _values;

  _InMemorySharedPreferencesService(this._values);

  @override
  Future<T?> get<T>({required SharedPreferencesKey key}) async =>
      _values[key.name] as T?;

  @override
  Future<void> set<T>({
    required SharedPreferencesKey key,
    required T value,
  }) async => _values[key.name] = value;

  @override
  Future<void> remove({required String key}) async => _values.remove(key);

  @override
  Future<void> clear() async => _values.clear();
}

class _NoopCrashlyticsService implements CrashlyticsService {
  @override
  void log(String message) {}

  @override
  void recordError({
    required dynamic exception,
    StackTrace? stackTrace,
    String? reason,
  }) {}

  @override
  void setUserId(String userId) {}
}

Widget _buildChantingSettings({required List<String> storedChantIds}) {
  return GetItScope(
    setupDependencies: (sl) async {
      await sl.reset();
      final preferences = _InMemorySharedPreferencesService({
        SharedPreferencesKey.selectedChants.name: jsonEncode(storedChantIds),
      });
      sl.registerFactory<ChantingSettingsCubit>(
        () => ChantingSettingsCubit(
          chantingApi: _FakeChantingPublicApi(),
          sharedPreferencesService: preferences,
          crashlyticsService: _NoopCrashlyticsService(),
        ),
      );
    },
    child: ChantingSettingsView.withCubit(),
  );
}

@widgetbook.UseCase(
  name: 'Populated playlist',
  type: ChantingSettingsView,
  path: '[Chanting]/public/view/chanting_settings/',
)
Widget buildChantingSettingsViewPopulated(BuildContext context) {
  return _buildChantingSettings(
    storedChantIds: _fixtureChants.take(3).map((chant) => chant.id).toList(),
  );
}

@widgetbook.UseCase(
  name: 'Empty playlist',
  type: ChantingSettingsView,
  path: '[Chanting]/public/view/chanting_settings/',
)
Widget buildChantingSettingsViewEmpty(BuildContext context) {
  return _buildChantingSettings(storedChantIds: const []);
}
