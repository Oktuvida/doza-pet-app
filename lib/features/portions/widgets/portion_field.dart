import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PortionField extends StatelessWidget {
  final String hintText;
  final String? suffixText;
  final TextEditingController? controller;
  final Icon? icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final bool readOnly;

  const PortionField(
      {super.key,
      required this.hintText,
      this.icon,
      this.controller,
      this.keyboardType,
      this.inputFormatters,
      this.suffixText,
      this.onTap,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
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
          prefixIcon: icon,
          suffixText: suffixText),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}
