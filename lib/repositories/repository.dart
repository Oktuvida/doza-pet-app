import 'package:doza_pet/db/db.dart';
import 'package:doza_pet/models/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Repository<T extends Model> {
  final String table;

  Repository({required this.table});

  Future<void> delete(String column, dynamic value) {
    return DB.remove(table, column, value);
  }

  Future<List<T>> getAll(
      [String columns = "*", options = const FetchOptions()]) async {
    final data = await DB.list(table, columns, options);
    return data.map((e) => fromRequestData(e)).toList();
  }

  Future<T?> getOne(String column, dynamic value) async {
    final data = await DB.findOne(table, column, value);
    return data != null ? fromRequestData(data) : null;
  }

  Future<void> insert(T data) {
    return DB.insert(table, toRequestData(data));
  }

  Future<void> update(T data, String column, dynamic value) {
    return DB.update(table, toRequestData(data), column, value);
  }

  T fromRequestData(Map<String, dynamic> data);
  Map<String, dynamic> toRequestData(T data);
}
