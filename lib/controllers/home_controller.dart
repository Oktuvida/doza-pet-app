import 'package:doza_pet/models/user_model.dart';
import 'package:doza_pet/repositories/user_interface.dart';

import '../db/virtual_db.dart';

class HomeController {
  final UserRepository _userRepo = UserRepository(VirtualDB());

  Future<UserModel?> findUser(int id) {
    return _userRepo.getOne(id);
  }

  Future<void> addUser(UserModel user) {
    return _userRepo.insert(user);
  }

  Future<void> removeUser(int id) {
    return _userRepo.delete(id);
  }
}
