

import 'package:core/src/data/datasource/data_provider.dart';
import 'package:core/src/domain/entity/serializable_entity.dart';

/// Base interface for CRUD operations on entities of type M.
abstract interface class CrudRepository<M extends SerializableEntity> {

  Future<void> create(M model);
  Future<M> read(String id, {bool preferCache});
  Stream<M> readStream(String id);
  Future<void> update(M model);
  Future<void> delete(String id);

}

/// A generic CRUD repository operations class that delegates to a DataProvider.
/// This class provides basic Create, Read, Update, and Delete operations
/// for a model of type M.
abstract class CrudRepositoryOps<M> {

  /// The data provider used to perform CRUD operations.
  final DataProvider<M> dataProvider;

  /// Constructs a [CrudRepositoryOps] with the given [dataProvider].
  const CrudRepositoryOps(this.dataProvider);

  Future<void> create(M model) => dataProvider.create(model);
  Future<M> read(String id, {bool preferCache = false}) => dataProvider.read(id, preferCache: preferCache);
  Stream<M> readStream(String id) => dataProvider.readStream(id);
  Future<void> update(M model) => dataProvider.update(model);
  Future<void> delete(String id) => dataProvider.delete(id);

}
