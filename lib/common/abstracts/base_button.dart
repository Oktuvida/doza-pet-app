import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;

  final VoidCallback onTap;
  final String label;

  const BaseButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
