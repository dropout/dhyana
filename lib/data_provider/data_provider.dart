import 'package:dhyana/model/query_options.dart';

abstract class DataProvider<M> {

  Future<void> create(M item);
  Future<M> read(String id);
  Stream<M> readStream(String id);
  Future<void> update(M item);
  Future<void> delete(String id);

  Future<List<M>> query(QueryOptions<M> queryOptions);
  Stream<List<M>> queryStream(QueryOptions<M> queryOptions);

}
