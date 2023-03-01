import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String placeholder;
  final bool? obscureText;
  const FormInput({
    super.key,
    required this.placeholder,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        decoration: InputDecoration(hintText: placeholder, filled: true),
        obscureText: obscureText == true ? true : false,
      ),
    );
  }
}
