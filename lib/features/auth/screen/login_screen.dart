import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/auth/widgets/auth_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:doza_pet/widgets/buttons/form_button.dart';
import 'package:doza_pet/widgets/inputs/form_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final appBar = UIConstants.appBar();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);

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
                  )
                ],
              )),
        ),
      ),
    );
  }
}
