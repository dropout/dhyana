import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/practice/chanting/chanting_module.dart';

abstract interface class ChantDataProvider implements DataProvider<Chant> {

  Future<List<Chant>> queryAll({bool preferCache});
  Stream<List<Chant>> queryAllStream();

}

