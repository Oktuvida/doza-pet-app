import 'package:doza_pet/common/common.dart';
import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/auth/controller/auth_controller.dart';
import 'package:doza_pet/features/auth/screen/login_screen.dart';
import 'package:doza_pet/features/auth/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const SignUpScreen());

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final appBar = UIConstants.appBar();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        username: usernameController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    var theme = Theme.of(context);

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AuthField(
                      controller: usernameController,
                      hintText: localizations!.username),
                  const SizedBox(
                    height: 25,
                  ),
                  AuthField(
                    controller: passwordController,
                    hintText: localizations.password,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onPressed: onSignUp,
                      label: localizations.continueMessage,
                      backgroundColor: theme.colorScheme.primary,
                      textColor: theme.colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                      text: TextSpan(text: localizations.signInAsk, children: [
                    TextSpan(
                        text: " ${localizations.signIn}",
                        style: TextStyle(
                            color: theme.colorScheme.primary, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, LoginScreen.route());
                          })
                  ]))
                ],
              )),
        ),
      ),
    );
  }
}
