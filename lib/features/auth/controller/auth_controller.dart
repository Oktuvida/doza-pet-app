import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/core/utils.dart';
import 'package:doza_pet/features/auth/apis/auth_api.dart';
import 'package:doza_pet/models/models.dart';
import 'package:doza_pet/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final _userRepository = UserRepository();

  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  void signUp(
      {required String email,
      required String password,
      required BigInt phone,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);

    if (res.isRight()) {
      final user = User(email, phone);
      (await _userRepository.insert(data: user))
          .fold((l) => showSnackBar(context, l.message), (r) {
        Navigator.pushReplacementNamed(context, RouteConstants.root);
      });
    } else {
      res.fold((l) => showSnackBar(context, l.message), (r) {
        Navigator.pushReplacementNamed(context, RouteConstants.root);
      });
    }
  }

  void signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signIn(email: email, password: password);

    res.fold((l) => showSnackBar(context, l.message),
        (r) => Navigator.pushReplacementNamed(context, RouteConstants.root));
  }
}
