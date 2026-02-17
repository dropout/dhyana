import 'package:dhyana/model/chant.dart';
import 'package:dhyana/repository/chants_repository.dart';
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

class StubbedChantsRepository implements ChantsRepository {
  final Faker _faker = Faker();
  late final List<Chant> _chants;

  StubbedChantsRepository() {
    _chants = List.generate(_chantNames.length, (index) {
      final chantName = _chantNames[index];
      return Chant(
        id: _faker.guid.guid(),
        name: chantName,
        audioResourceUrl: 'https://example.com/audio/${chantName.toLowerCase().replaceAll(' ', '_')}.mp3',
        lyricsResourceUrl: 'https://example.com/lyrics/${chantName.toLowerCase().replaceAll(' ', '_')}.txt',
      );
    });
  }

  @override
  Future<List<Chant>> queryAll() async {
    await Future.delayed(Duration(milliseconds: 500));
    return Future.value(List.from(_chants));
  }

  @override
  Stream<List<Chant>> queryAllStream() {
    return Stream.value(_chants);
  }

  @override
  Future<void> create(Chant model) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Chant> read(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _chants.firstWhere(
      (chant) => chant.id == id,
      orElse: () => throw Exception('Chant not found'),
    );
  }

  @override
  Stream<Chant> readStream(String id) {
    return Stream.value(
      _chants.firstWhere(
        (chant) => chant.id == id,
        orElse: () => throw Exception('Chant not found'),
      ),
    );
  }

  @override
  Future<void> update(Chant model) {
    throw UnimplementedError();
  }
}

