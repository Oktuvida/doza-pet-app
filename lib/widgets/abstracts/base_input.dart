import 'package:flutter/material.dart';

abstract class BaseInput extends StatelessWidget {
  final String placeholder;

  const BaseInput({
    super.key,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
