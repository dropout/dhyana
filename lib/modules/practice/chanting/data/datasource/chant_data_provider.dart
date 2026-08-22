import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_entity.dart';

abstract interface class ChantDataProvider 
  implements DataProvider<ChantEntity> {

  Future<List<ChantEntity>> queryAll({bool preferCache});
  Stream<List<ChantEntity>> queryAllStream();

}
