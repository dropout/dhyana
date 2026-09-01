import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:core/core.dart';

abstract interface class ChantRepository 
  implements CrudRepository<ChantEntity> {

  Future<List<ChantEntity>> queryAll({bool preferCache});
  Stream<List<ChantEntity>> queryAllStream();

}
