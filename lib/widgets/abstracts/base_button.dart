import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const BaseButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
