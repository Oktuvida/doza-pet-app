import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/auth/screen/login_screen.dart';
import 'package:doza_pet/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:doza_pet/screens/home_screen.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(name: 'Food Dispenser App Widgetbook'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      categories: [
        WidgetbookCategory(
          name: 'Widgets',
          folders: [WidgetbookFolder(name: "Buttons", widgets: [])],
        ),
        WidgetbookCategory(name: "Screens", widgets: [
          WidgetbookComponent(name: "$HomeScreen", useCases: [
            WidgetbookUseCase(
                name: "Default", builder: (context) => const HomeScreen())
          ]),
          WidgetbookComponent(name: "$OnboardingScreen", useCases: [
            WidgetbookUseCase(
                name: "Default", builder: (context) => const OnboardingScreen())
          ]),
          WidgetbookComponent(name: "$LoginScreen", useCases: [
            WidgetbookUseCase(
                name: "Default", builder: (context) => const LoginScreen())
          ])
        ])
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeConstants.light,
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeConstants.dark,
        )
      ],
      devices: const [Apple.iPhone11, Samsung.s10, Desktop.desktop1080p],
    );
  }
}
