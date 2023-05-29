import 'package:doza_pet/common/common.dart';
import 'package:doza_pet/common/utils/utils.dart';
import 'package:doza_pet/core/utils.dart';
import 'package:doza_pet/features/portions/widgets/portion_field.dart';
import 'package:doza_pet/features/portions/widgets/portion_viewer.dart';
import 'package:doza_pet/notifiers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:doza_pet/features/portions/controllers/portion_controller.dart";

final deviceId = BigInt.from(1);

class PortionScreen extends ConsumerStatefulWidget {
  const PortionScreen({super.key});

  @override
  ConsumerState<PortionScreen> createState() => _PortionScreenState();
}

class _PortionScreenState extends ConsumerState<PortionScreen> {
  final appBar = AppBar();

  final foodToDispenseController = TextEditingController();

  TimeOfDay dispensingTime = TimeOfDay.now();

  void selectTime() async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: dispensingTime);

    if (time != null) {
      setState(() {
        dispensingTime = time;
      });
    }
  }

  void onContinueHandler() {
    if (foodToDispenseController.text.isEmpty) {
      return showSnackBar(context, "Not all fields have been filled in");
    }

    ref.read(portionControllerProvider.notifier).addPortion(
        deviceId: deviceId,
        foodToDispense: double.parse(foodToDispenseController.text),
        dispensingTime: timeToMinutes(dispensingTime.format(context)),
        context: context);

    foodToDispenseController.clear();
  }

  void onTapHandler(BigInt portionId) {
    ref
        .read(portionControllerProvider.notifier)
        .deletePortion(id: portionId, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final portions = ref.watch(userProvider).portions;

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Center(
              child: RichText(
                  text: TextSpan(
                      text: localizations.portions,
                      style: theme.textTheme.displaySmall!
                          .copyWith(color: theme.colorScheme.primary))),
            ),
            const SizedBox(
              height: 30,
            ),
            for (final portion in portions)
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 10),
                child: PortionViewer(
                    portionId: portion.id!,
                    onTap: onTapHandler,
                    foodToDispense: portion.foodToDispense.toString(),
                    dispensingTime: portion.dispensingTime),
              ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: theme.colorScheme.primary, width: 1))),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: localizations.addPortion,
                    style: theme.textTheme.headlineMedium!
                        .copyWith(color: theme.colorScheme.primary))),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                PortionField(
                  hintText: "${localizations.foodToDispense} (gr)",
                  controller: foodToDispenseController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 25,
                ),
                PortionField(
                  hintText: localizations.dispensingTime,
                  suffixText: dispensingTime.format(context),
                  onTap: selectTime,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: RoundedSmallButton(
                    onTap: onContinueHandler,
                    label: localizations.continueMessage,
                    backgroundColor: theme.colorScheme.primary,
                    textColor: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
