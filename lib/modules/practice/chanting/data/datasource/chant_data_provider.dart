import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/core/domain/entity/chant/chant.dart';

abstract interface class ChantDataProvider implements DataProvider<Chant> {

  Future<List<Chant>> queryAll();
  Stream<List<Chant>> queryAllStream();

}

