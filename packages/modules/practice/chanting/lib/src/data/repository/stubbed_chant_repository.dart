import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:chanting/src/domain/entity/chant_metadata_entity.dart';
import 'package:chanting/src/domain/repository/chant_repository.dart';
import 'package:core/core.dart';
import 'package:faker/faker.dart';

const List<String> _chantNames = [
  'Om Mani Padme Hum',
  'Gayatri Mantra',
  'Maha Mrityunjaya Mantra',
  'Om Namah Shivaya',
  'Hare Krishna',
  'Om Tare Tuttare Ture Soha',
  'Heart Sutra',
  'Medicine Buddha Mantra',
  'Green Tara Mantra',
  'Vajrasattva Mantra',
  'Chenrezig Mantra',
  'Lokah Samastah Sukhino Bhavantu',
  'Asato Ma Sat Gamaya',
  'Om Gam Ganapataye Namaha',
  'Shanti Mantra',
];

class StubbedChantRepository implements ChantRepository {
  final Faker _faker = Faker();
  late final List<ChantEntity> _chants;

  StubbedChantRepository() {
    _chants = List.generate(_chantNames.length, (index) {
      final chantName = _chantNames[index];
      return ChantEntity(
        id: _faker.guid.guid(),
        order: index,
        name: chantName,
        length: Duration(minutes: 5 + index),
        blurHash: DefaultProfileData.photoBlurhash,
        metaData: ChantMetaDataEntity(
          id: _faker.guid.guid(),
          audioVersion: 1,
          lyricsVersion: 1,
          coverVersion: 1,
          audioSha256: _faker.randomGenerator.string(64),
          lyricsSha256: _faker.randomGenerator.string(64),
          coverSha256: _faker.randomGenerator.string(64),
          audioBytes: 1024 * (5 + index),
          lyricsBytes: 512 * (5 + index),
          coverBytes: 256 * (5 + index),
          updatedAt: DateTime.now().subtract(Duration(days: index)),
        )
      );
    });
  }

  @override
  Future<List<ChantEntity>> queryAll({bool preferCache = false}) async {
    await Future.delayed(Duration(milliseconds: 500));
    return Future.value(List.from(_chants));
  }

  @override
  Stream<List<ChantEntity>> queryAllStream() {
    return Stream.value(_chants);
  }

  @override
  Future<void> create(ChantEntity model) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<ChantEntity> read(String id, {bool preferCache = false}) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _chants.firstWhere(
      (chant) => chant.id == id,
      orElse: () => throw Exception('Chant not found'),
    );
  }

  @override
  Stream<ChantEntity> readStream(String id) {
    return Stream.value(
      _chants.firstWhere(
        (chant) => chant.id == id,
        orElse: () => throw Exception('Chant not found'),
      ),
    );
  }

  @override
  Future<void> update(ChantEntity model) {
    throw UnimplementedError();
  }
}

