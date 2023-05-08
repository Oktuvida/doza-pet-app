import 'package:doza_pet/common/widgets/rounded_small_button.dart';
import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/auth/controller/auth_controller.dart';
import 'package:doza_pet/features/auth/widgets/auth_field.dart';
import 'package:doza_pet/features/auth/widgets/auth_redirect_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final appBar = UIConstants.appBar();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        phone: BigInt.parse(phoneController.text),
        context: context);
  }

  void onFormHighlightedTextTap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AuthField(
                      controller: emailController,
                      hintText: localizations.username,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthField(
                      controller: phoneController,
                      hintText: localizations.phone,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
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
                        onTap: onSignUp,
                        label: localizations.continueMessage,
                        backgroundColor: theme.colorScheme.primary,
                        textColor: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 40),
            AuthRedirectText(
                text: localizations.signInAsk,
                highlightedText: localizations.signIn,
                onHighlightedTextTap: onFormHighlightedTextTap)
          ],
        )),
      ),
    );
  }
}
