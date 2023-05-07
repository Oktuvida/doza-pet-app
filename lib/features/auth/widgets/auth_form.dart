import 'package:doza_pet/common/rounded_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth_field.dart';

class AuthForm extends ConsumerStatefulWidget {
  final void Function(String username, String password) onButtonTap;
  const AuthForm({super.key, required this.onButtonTap});

  @override
  ConsumerState<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends ConsumerState<AuthForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Padding(
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
              obscureText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topRight,
              child: RoundedSmallButton(
                onTap: () => widget.onButtonTap(
                    usernameController.text, passwordController.text),
                label: localizations.continueMessage,
                backgroundColor: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ));
  }
}
