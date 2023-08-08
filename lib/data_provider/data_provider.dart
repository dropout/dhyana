import 'package:dhyana/model/query_options.dart';

abstract class DataProvider<T> {

  Future<T> getItemById(String id);
  Stream<T> getItemStreamById(String id);

  Future<List<T>> getItems(QueryOptions<T> queryOptions);
  Stream<List<T>> getItemsStream(QueryOptions<T> queryOptions);

  Future<void> setItem(T item);
  Future<void> updateItem(T item);
  Future<void> deleteItem(String id);

}
