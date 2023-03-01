import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormButton extends StatelessWidget {
  final void Function() onPressed;
  const FormButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        ),
        child: Text(localizations!.continueMessage),
      ),
    );
  }
}
