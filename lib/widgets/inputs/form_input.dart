import 'package:doza_pet/widgets/abstracts/base_input.dart';
import 'package:flutter/material.dart';

class FormInput extends BaseInput {
  final bool? obscureText;

  const FormInput({super.key, required super.placeholder, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
          decoration: InputDecoration(hintText: placeholder, filled: true),
          obscureText: obscureText ?? false),
    );
  }
}
