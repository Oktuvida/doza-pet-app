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
  var username = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);

    return Container(
      decoration: const BoxDecoration(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormInput(placeholder: localizations!.username),
            FormInput(
              placeholder: localizations.password,
              obscureText: true,
            ),
            FormButton(
              onPressed: () {
                if (kDebugMode) {
                  print("I was pressed!");
                }
              },
              child: Text(localizations.continueMessage),
            ),
            const Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text("New User? Create Account"),
            )),
          ],
        ),
      ),
    );
  }
}
