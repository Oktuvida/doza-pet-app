import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  const AuthField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.inputFormatters = const []});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 3, color: theme.colorScheme.primary)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: theme.colorScheme.onBackground)),
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}
