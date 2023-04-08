import 'package:doza_pet/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final authAPIProvider = riverpod.Provider((ref) {
  return AuthAPI();
});

abstract class IAuthAPI {
  FutureEither<User?> signUp(
      {required String username, required String password});

  FutureEither<User?> signIn(
      {required String username, required String password});
}

class AuthAPI implements IAuthAPI {
  @override
  FutureEither<User?> signUp(
      {required String username, required String password}) async {
    try {
      final result =
          await supabase.auth.signUp(email: username, password: password);
      return right(result.user);
    } on AuthException catch (e, stackTrace) {
      return left(Failure(e.message, stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<User?> signIn(
      {required String username, required String password}) async {
    try {
      final result = await supabase.auth
          .signInWithPassword(email: username, password: password);
      return right(result.user);
    } on AuthException catch (e, stackTrace) {
      return left(Failure(e.message, stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
