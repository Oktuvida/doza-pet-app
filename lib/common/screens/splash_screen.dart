import 'package:doza_pet/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _redirectedCalled = false;

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
      Navigator.pushReplacementNamed(context, RouteConstants.home);
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
