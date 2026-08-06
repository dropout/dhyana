import 'package:dhyana/core/domain/entity/entity.dart';

/// Base interface for CRUD operations on entities of type M.
abstract interface class CrudRepository<M extends Dto> {

  Future<void> create(M model);
  Future<M> read(String id, {bool preferCache});
  Stream<M> readStream(String id);
  Future<void> update(M model);
  Future<void> delete(String id);

}
