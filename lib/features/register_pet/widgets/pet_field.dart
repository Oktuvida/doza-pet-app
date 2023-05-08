import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PetField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const PetField(
      {super.key,
      required this.hintText,
      this.icon,
      required this.controller,
      this.keyboardType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(width: 3, color: theme.colorScheme.primary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: theme.colorScheme.onBackground)),
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          prefixIcon: icon),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}
