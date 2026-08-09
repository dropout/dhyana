

import 'package:dhyana/modules/practice/chanting/public/model/chant.dart';

abstract interface class ChantingPublicApi {
  Future<List<Chant>> loadChants({bool preferCache = false});
  Stream<List<Chant>> get chantsStream;
  Future<void> clearCachedChants();
}