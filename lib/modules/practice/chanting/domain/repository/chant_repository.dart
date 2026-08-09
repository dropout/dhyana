import 'package:dhyana/modules/practice/chanting/chanting_module.dart';
import 'package:dhyana/core/data/repository/crud_repository.dart';

abstract interface class ChantRepository implements CrudRepository<Chant> {

  Future<List<Chant>> queryAll({bool preferCache});
  Stream<List<Chant>> queryAllStream();

}

