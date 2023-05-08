import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

abstract class DB {
  static Future<void> insert(String table, Map<String, dynamic> item) async {
    await supabase.from(table).insert(item);
  }

  static Future<void> remove(String table, String column, dynamic value) async {
    await supabase.from(table).delete().eq(column, value);
  }

  static Future<void> update(String table, Map<String, dynamic> item,
      String column, dynamic value) async {
    await supabase.from(table).update(item).eq(column, value);
  }

  static Future<List<Map<String, dynamic>>> list(String table,
      [String columns = "*",
      FetchOptions options = const FetchOptions()]) async {
    return await supabase.from(table).select(columns, options);
  }

  static Future<Map<String, dynamic>?> findOne(
      String table, String column, dynamic value) async {
    return await supabase.from(table).select().eq(column, value);
  }
}
