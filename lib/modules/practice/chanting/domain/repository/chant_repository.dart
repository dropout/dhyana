import 'package:dhyana/core/domain/entity/chant/chant.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository.dart';

abstract interface class ChantRepository implements CrudRepository<Chant> {

  Future<List<Chant>> queryAll();
  Stream<List<Chant>> queryAllStream();

}

