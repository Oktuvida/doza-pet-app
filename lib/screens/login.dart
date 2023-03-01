import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:doza_pet/widgets/buttons/form_button.dart';
import 'package:doza_pet/widgets/inputs/form_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            )
          ],
        ),
      ),
    );
  }
}
