import 'package:dhyana/data_provider/data_provider.dart';

/*
    Forward crud operations to data provider.
 */
abstract class CrudRepositoryOps<M> {

  final DataProvider<M> dataProvider;

  const CrudRepositoryOps(this.dataProvider);

  Future<void> create(M model) => dataProvider.create(model);
  Future<M> read(String id) => dataProvider.read(id);
  Stream<M> readStream(String id) => dataProvider.readStream(id);
  Future<void> update(M model) => dataProvider.update(model);
  Future<void> delete(String id) => dataProvider.delete(id);

}
