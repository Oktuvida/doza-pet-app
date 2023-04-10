import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/auth/controller/auth_controller.dart';
import 'package:doza_pet/features/auth/widgets/auth_form.dart';
import 'package:doza_pet/features/auth/widgets/auth_redirect_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final appBar = UIConstants.appBar();

  void onSignIn(String username, String password) {
    ref
        .read(authControllerProvider.notifier)
        .signIn(username: username, password: password, context: context);
  }

  void onFormHighlightedTextTap() {
    Navigator.pushNamed(context, RouteConstants.signUp);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            AuthForm(onButtonTap: onSignIn),
            const SizedBox(height: 40),
            AuthRedirectText(
                text: localizations!.signUpAsk,
                highlightedText: localizations.signUp,
                onHighlightedTextTap: onFormHighlightedTextTap)
          ],
        )),
      ),
    );
  }
}
