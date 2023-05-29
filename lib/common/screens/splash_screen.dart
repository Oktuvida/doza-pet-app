import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/core/utils.dart';
import 'package:doza_pet/notifiers/user_provider.dart';
import 'package:doza_pet/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _redirectedCalled = false;
  final _petRepository = PetRepository();
  final _portionRepository = PortionRepository();

  @override
  void didChangeDependencies() {
    _redirect();
    super.didChangeDependencies();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);

    if (_redirectedCalled || !mounted) {
      return;
    }

    _redirectedCalled = true;
    final session = supabase.auth.currentSession;
    if (session != null) {
      final pets = await _petRepository.get(
          column: "id_usuario", value: session.user.email);
      final portions = await _portionRepository.get(
          column: "email", value: session.user.email, view: "usuario");

      if (portions.isRight() && pets.isRight()) {
        ref.read(userProvider.notifier).set(session.user.email,
            pets.getRight().toNullable()!, portions.getRight().toNullable()!);
      }

      pets.call(portions).fold((l) {
        showSnackBar(context, l.message);
        Navigator.pushReplacementNamed(context, RouteConstants.signIn);
      }, (r) {
        Navigator.pushReplacementNamed(context, RouteConstants.home);
      });
    } else {
      Navigator.pushReplacementNamed(context, RouteConstants.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
