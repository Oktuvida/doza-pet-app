import 'package:flutter/material.dart';

import 'abstracts/base_button.dart';

class RoundedSmallButton extends BaseButton {
  const RoundedSmallButton(
      {super.key,
      required super.onPressed,
      required super.label,
      super.backgroundColor,
      super.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
