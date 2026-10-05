import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';

abstract interface class ChantDataProvider 
  implements DataProvider<ChantEntity> {

  Future<List<ChantEntity>> queryAll({bool preferCache});
  Stream<List<ChantEntity>> queryAllStream();

}
