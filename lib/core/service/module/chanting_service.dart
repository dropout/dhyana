import 'package:dhyana/core/domain/entity/chant/chant.dart';

abstract interface class ChantingService {
  Future<List<Chant>> loadChants();
  Future<void> clearCache();
}
