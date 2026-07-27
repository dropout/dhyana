import 'package:dhyana/core/domain/entity/entity.dart';

abstract interface class CrudRepository<M extends Entity> {

  Future<void> create(M model);
  Future<M> read(String id);
  Stream<M> readStream(String id);
  Future<void> update(M model);
  Future<void> delete(String id);

}
