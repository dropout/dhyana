abstract interface class DataProvider<M> {

  Future<void> create(M item);
  Future<M> read(String id);
  Stream<M> readStream(String id);
  Future<void> update(M item);
  Future<void> delete(String id);

}
