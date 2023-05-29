import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

abstract class DB {
  static Future<List<Map<String, dynamic>>> insert(
      String table, Map<String, dynamic> item) async {
    final res = await supabase.from(table).insert(item).select();

    return DB._toMap(res);
  }

  static Future<List<Map<String, dynamic>>> remove(
      String table, String column, dynamic value) async {
    final res = await supabase.from(table).delete().eq(column, value).select();
    return DB._toMap(res);
  }

  static Future<List<Map<String, dynamic>>> update(String table,
      Map<String, dynamic> item, String column, dynamic value) async {
    final res =
        await supabase.from(table).update(item).eq(column, value).select();
    return DB._toMap(res);
  }

  static Future<List<Map<String, dynamic>>> list(String table,
      [String columns = "*",
      FetchOptions options = const FetchOptions()]) async {
    final res = await supabase.from(table).select(columns, options);
    return DB._toMap(res);
  }

  static Future<List<Map<String, dynamic>>> find(
      String table, String column, dynamic value,
      [String columns = "*"]) async {
    final res = await supabase.from(table).select(columns).eq(column, value);
    return DB._toMap(res);
  }

  static List<Map<String, dynamic>> _toMap(dynamic data) {
    return List<Map<String, dynamic>>.from(data);
  }
}
