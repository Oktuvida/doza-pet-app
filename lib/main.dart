import 'package:doza_pet/common/screens/splash_screen.dart';
import 'package:doza_pet/constants/supabase_constants.dart';
import 'package:doza_pet/features/auth/screen/signin_screen.dart';
import 'package:doza_pet/features/auth/screen/signup_screen.dart';
import 'package:doza_pet/screens/home_screen.dart';
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
      theme: ThemeConstants.light,
      darkTheme: ThemeConstants.dark,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        RouteConstants.home: (context) => const HomeScreen(),
        RouteConstants.signIn: (context) => const SignInScreen(),
        RouteConstants.signUp: (context) => const SignUpScreen()
      },
    );
  }
}
