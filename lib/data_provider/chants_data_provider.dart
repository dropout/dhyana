import 'package:dhyana/data_provider/data_provider.dart';
import 'package:dhyana/model/chant.dart';

abstract interface class ChantsDataProvider implements DataProvider<Chant> {

  Future<List<Chant>> queryAll();
  Stream<List<Chant>> queryAllStream();

}

