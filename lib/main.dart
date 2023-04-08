import 'package:doza_pet/constants/supabase_constants.dart';
import 'package:doza_pet/features/on_boarding/screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: SupabaseConstants.url, anonKey: SupabaseConstants.anonKey);

  return runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: AppConstants.name,
      home: const OnBoardingScreen(),
      theme: ThemeConstants.light,
      darkTheme: ThemeConstants.dark,
    );
  }
}
