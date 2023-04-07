import 'package:doza_pet/db/virtual_db.dart';
import 'package:doza_pet/models/models.dart';

abstract class IUserRepository {
  Future<void> delete(int id);
  Future<List<User>> getAll();
  Future<User?> getOne(int id);
  Future<void> insert(User user);
  Future<void> update(User user);
}

class UserRepository implements IUserRepository {
  final VirtualDB _db;

  UserRepository(this._db);

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }

  @override
  Future<List<User>> getAll() async {
    var items = await _db.list();
    return items.map((item) => User.fromMap(item)).toList();
  }

  @override
  Future<User?> getOne(int id) async {
    var item = await _db.findOne(id);
    return item != null ? User.fromMap(item) : null;
  }

  @override
  Future<void> insert(User user) async {
    await _db.insert(user.toMap());
  }

  @override
  Future<void> update(User user) async {
    await _db.update(user.toMap());
  }
}
