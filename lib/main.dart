import 'package:doza_pet/features/auth/screen/login_screen.dart';
import 'package:doza_pet/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'constants/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: AppConstants.name,
      home: const LoginScreen(),
      theme: ThemeConstants.light,
      darkTheme: ThemeConstants.dark,
    );
  }
}
