import 'package:doza_pet/gen/assets.gen.dart';
import 'package:doza_pet/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Assets.images.cuteDogs.provider(),
                    fit: BoxFit.cover)),
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: localizations!.welcomeHeaderMessage,
                          style: theme.textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary)),
                      const TextSpan(text: "\n"),
                      TextSpan(
                          text: localizations.welcomeBodyMessage,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.normal))
                    ])),
              ),
              FittedBox(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: PrimaryButton(
                    onPressed: () => {},
                    child: Row(
                      children: [
                        Text(
                          localizations.welcomeButtonMessage,
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
