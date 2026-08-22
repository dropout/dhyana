import 'package:dhyana/modules/practice/chanting/domain/entity/chant_entity.dart';
import 'package:dhyana/core/data/repository/crud_repository.dart';

abstract interface class ChantRepository 
  implements CrudRepository<ChantEntity> {

  Future<List<ChantEntity>> queryAll({bool preferCache});
  Stream<List<ChantEntity>> queryAllStream();

}
