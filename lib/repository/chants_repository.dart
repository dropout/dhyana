import 'package:dhyana/model/chant.dart';
import 'package:dhyana/core/domain/repository/crud_repository.dart';

abstract interface class ChantsRepository implements CrudRepository<Chant> {

  Future<List<Chant>> queryAll();
  Stream<List<Chant>> queryAllStream();

}

