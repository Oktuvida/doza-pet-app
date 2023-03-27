import 'package:doza_pet/widgets/abstracts/base_button.dart';
import 'package:flutter/material.dart';

class FormButton extends BaseButton {
  const FormButton({super.key, required super.onPressed, required super.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        ),
        child: child,
      ),
    );
  }
}
