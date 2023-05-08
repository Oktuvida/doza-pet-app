import 'package:doza_pet/db/db.dart';
import 'package:doza_pet/models/model.dart';

abstract class Repository<T extends Model> {
  final String table;
  final String primaryTableKey;

  Repository({required this.table, required this.primaryTableKey});

  Future<void> delete(int id) {
    return DB.remove(table, "id", id);
  }

  Future<List<T>> getAll() async {
    final data = await DB.list(table);
    return data.map((e) => fromRequestData(e)).toList();
  }

  Future<T?> getOne(int id) async {
    final data = await DB.findOne(table, primaryTableKey, id);
    return data != null ? fromRequestData(data) : null;
  }

  Future<void> insert(T data) {
    return DB.insert(table, toRequestData(data));
  }

  Future<void> update(T data, int id) {
    return DB.update(table, toRequestData(data), primaryTableKey, id);
  }

  T fromRequestData(Map<String, dynamic> data);
  Map<String, dynamic> toRequestData(T data);
}
