import 'package:doza_pet/common/common.dart';
import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/auth/controller/auth_controller.dart';
import 'package:doza_pet/features/auth/screen/signup_screen.dart';
import 'package:doza_pet/features/auth/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final appBar = UIConstants.appBar();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void onSignIn() {
    ref.read(authControllerProvider.notifier).signIn(
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
                      onTap: onSignIn,
                      label: localizations.continueMessage,
                      backgroundColor: theme.colorScheme.primary,
                      textColor: theme.colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                      text: TextSpan(text: localizations.signUpAsk, children: [
                    TextSpan(
                        text: " ${localizations.signUp}",
                        style: TextStyle(
                            color: theme.colorScheme.primary, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, SignUpScreen.route());
                          })
                  ]))
                ],
              )),
        ),
      ),
    );
  }
}
