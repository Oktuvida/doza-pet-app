import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/auth/controller/auth_controller.dart';
import 'package:doza_pet/features/auth/widgets/auth_form.dart';
import 'package:doza_pet/features/auth/widgets/auth_redirect_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final appBar = UIConstants.appBar();

  void onSignUp(String username, String password) {
    ref
        .read(authControllerProvider.notifier)
        .signUp(username: username, password: password, context: context);
  }

  void onFormHighlightedTextTap() {
    Navigator.pop(context);
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
            AuthForm(onButtonTap: onSignUp),
            const SizedBox(height: 40),
            AuthRedirectText(
                text: localizations!.signInAsk,
                highlightedText: localizations.signIn,
                onHighlightedTextTap: onFormHighlightedTextTap)
          ],
        )),
      ),
    );
  }
}
