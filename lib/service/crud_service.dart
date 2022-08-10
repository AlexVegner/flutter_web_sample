abstract class CrudService<T> {
  Future<List<T>> list();

  Future<T?> byId(String id);

  Future<T> create(T doc);

  Future<T> update(T doc);

  Future<bool> delete(String id);
}
