import 'package:doza_pet/features/register_pet/widgets/pet_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PetInformationScreen extends StatefulWidget {
  const PetInformationScreen({super.key});

  @override
  State<PetInformationScreen> createState() => _PetInformationScreenState();
}

class _PetInformationScreenState extends State<PetInformationScreen> {
  final appBar = AppBar();

  final nameControler = TextEditingController();
  final weightController = TextEditingController();
  final raceController = TextEditingController();
  final ageController = TextEditingController();
  final foodBrandController = TextEditingController();

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
          child: Column(
            children: [
              RichText(
                  text: TextSpan(
                      text: localizations.petInformation,
                      style: theme.textTheme.displaySmall)),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    PetField(
                      controller: nameControler,
                      hintText: localizations.name,
                      icon: const Icon(Icons.pets),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PetField(
                      controller: weightController,
                      hintText: localizations.weight,
                      icon: const Icon(Icons.balance),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PetField(
                        controller: raceController,
                        hintText: localizations.race),
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
                      icon: const Icon(Icons.food_bank),
                      keyboardType: TextInputType.name,
                    )
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
