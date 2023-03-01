import 'package:doza_pet/db/virtual_db.dart';
import 'package:doza_pet/models/user_model.dart';

abstract class IUserRepository {
  Future<void> delete(int id);
  Future<List<UserModel>> getAll();
  Future<UserModel?> getOne(int id);
  Future<void> insert(UserModel user);
  Future<void> update(UserModel user);
}

class UserRepository implements IUserRepository {
  final VirtualDB _db;

  UserRepository(this._db);

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }

  @override
  Future<List<UserModel>> getAll() async {
    var items = await _db.list();
    return items.map((item) => UserModel.fromMap(item)).toList();
  }

  @override
  Future<UserModel?> getOne(int id) async {
    var item = await _db.findOne(id);
    return item != null ? UserModel.fromMap(item) : null;
  }

  @override
  Future<void> insert(UserModel user) async {
    await _db.insert(user.toMap());
  }

  @override
  Future<void> update(UserModel user) async {
    await _db.update(user.toMap());
  }
}
