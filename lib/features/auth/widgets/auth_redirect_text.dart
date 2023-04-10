import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  final String text;
  final String highlightedText;
  final void Function() onHighlightedTextTap;
  const AuthRedirectText(
      {super.key,
      required this.text,
      required this.highlightedText,
      required this.onHighlightedTextTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
        text: TextSpan(
            text: text,
            style: TextStyle(color: theme.colorScheme.onBackground),
            children: [
          TextSpan(
              text: " $highlightedText",
              style: TextStyle(color: theme.colorScheme.primary, fontSize: 16),
              recognizer: TapGestureRecognizer()..onTap = onHighlightedTextTap)
        ]));
  }
}
