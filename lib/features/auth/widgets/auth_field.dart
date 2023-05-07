import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  const AuthField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText});

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
      obscureText: obscureText ?? false,
    );
  }
}
