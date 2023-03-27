import 'package:doza_pet/widgets/abstracts/base_button.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton(
      {super.key, required super.onPressed, required super.child});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(15.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
            backgroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return theme.colorScheme.onPrimary;
              }
              return theme.colorScheme.primary;
            }),
            foregroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return theme.colorScheme.primary;
              }
              return theme.colorScheme.onPrimary;
            })),
        onPressed: () => {},
        child: child);
  }
}
