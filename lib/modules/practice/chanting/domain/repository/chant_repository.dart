import 'package:dhyana/modules/practice/chanting/chanting_module.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository.dart';

abstract interface class ChantRepository implements CrudRepository<Chant> {

  Future<List<Chant>> queryAll();
  Stream<List<Chant>> queryAllStream();

}

