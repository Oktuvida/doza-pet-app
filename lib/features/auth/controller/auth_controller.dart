import 'package:doza_pet/apis/auth_api.dart';
import 'package:doza_pet/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  void signUp(
      {required String username,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signUp(username: username, password: password);

    res.fold(
        (l) => showSnackBar(context, l.message), (r) => debugPrint(r?.email));
  }

  void signIn(
      {required String username,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signIn(username: username, password: password);

    res.fold(
        (l) => showSnackBar(context, l.message), (r) => debugPrint(r?.email));
  }
}
