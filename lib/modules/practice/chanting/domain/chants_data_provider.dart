import 'package:dhyana/core/data/data_provider.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant.dart';

abstract interface class ChantsDataProvider implements DataProvider<Chant> {

  Future<List<Chant>> queryAll();
  Stream<List<Chant>> queryAllStream();

}

