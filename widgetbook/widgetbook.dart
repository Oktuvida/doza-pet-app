import 'package:flutter/material.dart';
import 'package:doza_pet/screens/home_screen.dart';
import 'package:doza_pet/utils/theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:doza_pet/widgets/buttons/form_button.dart';

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
          folders: [
            WidgetbookFolder(name: "Buttons", widgets: [
              WidgetbookComponent(name: "$FormButton", useCases: [
                WidgetbookUseCase(
                    name: "Default",
                    builder: (context) => FormButton(onPressed: () {}))
              ])
            ])
          ],
        ),
        WidgetbookCategory(name: "Screens", widgets: [
          WidgetbookComponent(name: "$HomeScreen", useCases: [
            WidgetbookUseCase(
                name: "Default", builder: (builder) => const HomeScreen())
          ])
        ])
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: lightThemeData,
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: darkThemeData,
        )
      ],
      devices: const [Apple.iPhone11, Samsung.s10, Desktop.desktop1080p],
    );
  }
}
