import 'package:doza_pet/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final authAPIProvider = riverpod.Provider((ref) {
  return AuthAPIImpl();
});

abstract class AuthAPI {
  FutureEither<User?> signUp({required String email, required String password});

  FutureEither<User?> signIn({required String email, required String password});
}

class AuthAPIImpl implements AuthAPI {
  @override
  FutureEither<User?> signUp(
      {required String email, required String password}) async {
    try {
      final result =
          await supabase.auth.signUp(email: email, password: password);
      return right(result.user);
    } on AuthException catch (e, stackTrace) {
      return left(Failure(e.message, stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<User?> signIn(
      {required String email, required String password}) async {
    try {
      final result = await supabase.auth
          .signInWithPassword(email: email, password: password);
      return right(result.user);
    } on AuthException catch (e, stackTrace) {
      return left(Failure(e.message, stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
