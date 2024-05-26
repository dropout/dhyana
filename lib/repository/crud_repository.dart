import 'package:dhyana/model/model.dart';

abstract interface class CrudRepository<M extends Model> {

  Future<void> create(M model);
  Future<M> read(String id);
  Stream<M> readStream(String id);
  Future<void> update(M model);
  Future<void> delete(String id);

}
