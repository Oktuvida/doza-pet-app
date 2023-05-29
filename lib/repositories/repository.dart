import 'package:doza_pet/core/failure.dart';
import 'package:doza_pet/core/type_defs.dart';
import 'package:doza_pet/db/db.dart';
import 'package:doza_pet/models/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Repository<T extends Model> {
  final String table;

  Repository({required this.table});

  FutureEither<List<T>> delete(
      {required String column, required dynamic value}) async {
    try {
      final data = await DB.remove(table, column, value);
      return right(data.map((e) => fromRequestData(e)).toList());
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<List<T>> getAll(
      {String columns = "*", options = const FetchOptions()}) async {
    try {
      final data = await DB.list(table, columns, options);
      return right(data.map((e) => fromRequestData(e)).toList());
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<List<T>> get(
      {required String column,
      required dynamic value,
      String columns = "*",
      String view = ""}) async {
    try {
      final data =
          await DB.find(_getTableNameWithView(view), column, value, columns);
      return right(data.map((e) => fromRequestData(e)).toList());
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<List<T>> insert({required T data}) async {
    try {
      final res = await DB.insert(table, toRequestData(data));
      return right(res.map((e) => fromRequestData(e)).toList());
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  FutureEither<List<T>> update(
      {required T data, required String column, required dynamic value}) async {
    try {
      final res = await DB.update(table, toRequestData(data), column, value);
      return right(res.map((e) => fromRequestData(e)).toList());
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  T fromRequestData(Map<String, dynamic> data);
  Map<String, dynamic> toRequestData(T data);
  String _getTableNameWithView(String view) {
    var viewName = "";
    if (view.isNotEmpty) {
      viewName = "_$view";
    }

    return "$table$viewName";
  }
}
