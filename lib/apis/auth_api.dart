import 'package:doza_pet/core/core.dart';
import 'package:doza_pet/db/virtual_db.dart';
import 'package:doza_pet/models/models.dart';
import 'package:doza_pet/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI();
});

abstract class IAuthAPI {
  FutureEither<User> signUp(
      {required String username, required String password});
}

class AuthAPI implements IAuthAPI {
  final _userRepo = UserRepository(VirtualDB());
  @override
  FutureEither<User> signUp(
      {required String username, required String password}) async {
    try {
      final user = User(username, password);
      await _userRepo.insert(user);
      return right(user);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
