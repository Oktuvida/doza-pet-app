import 'package:flutter/material.dart';
import 'package:doza_pet/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:doza_pet/utils/names.dart';
import 'package:doza_pet/utils/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: appName,
      home: const HomeScreen(),
      theme: lightThemeData,
      darkTheme: darkThemeData,
    );
  }
}
