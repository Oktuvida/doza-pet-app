import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/features/register_pet/controllers/pet_controller.dart';
import 'package:doza_pet/features/register_pet/widgets/pet_field.dart';
import 'package:doza_pet/notifiers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:doza_pet/common/common.dart";

class PetInformationScreen extends ConsumerStatefulWidget {
  const PetInformationScreen({super.key});

  @override
  ConsumerState<PetInformationScreen> createState() =>
      _PetInformationScreenState();
}

class _PetInformationScreenState extends ConsumerState<PetInformationScreen> {
  final appBar = AppBar();

  final nameControler = TextEditingController();
  final weightController = TextEditingController();
  final raceController = TextEditingController();
  final ageController = TextEditingController();
  final foodBrandController = TextEditingController();

  void onContinueHandler() {
    final email = ref.watch(userProvider).email;
    ref.read(petControllerProvider.notifier).addPetInformation(
        age: int.parse(ageController.text),
        foodBrand: foodBrandController.text,
        name: nameControler.text,
        race: raceController.text,
        userId: email!,
        weight: double.parse(weightController.text),
        context: context);
  }

  void onCancelHandler() {
    Navigator.pushReplacementNamed(context, RouteConstants.root);
  }

  @override
  void dispose() {
    nameControler.dispose();
    weightController.dispose();
    raceController.dispose();
    ageController.dispose();
    foodBrandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                RichText(
                    text: TextSpan(
                        text: localizations.petInformation,
                        style: theme.textTheme.displaySmall!
                            .copyWith(color: theme.colorScheme.primary))),
                const SizedBox(
                  height: 30,
                ),
                PetField(
                  controller: nameControler,
                  hintText: localizations.name,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 25,
                ),
                PetField(
                  controller: weightController,
                  hintText: "${localizations.weight} (KG)",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 25,
                ),
                PetField(
                    controller: raceController, hintText: localizations.race),
                const SizedBox(
                  height: 25,
                ),
                PetField(
                  controller: ageController,
                  hintText: localizations.age,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 25,
                ),
                PetField(
                  controller: foodBrandController,
                  hintText: localizations.foodBrand,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedSmallButton(
                      onTap: onCancelHandler,
                      label: localizations.cancelMessage,
                      backgroundColor: theme.colorScheme.primary,
                      textColor: theme.colorScheme.onPrimary,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    RoundedSmallButton(
                      onTap: onContinueHandler,
                      label: localizations.continueMessage,
                      backgroundColor: theme.colorScheme.primary,
                      textColor: theme.colorScheme.onPrimary,
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
