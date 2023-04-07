import 'package:flutter/material.dart';

import 'app_constants.dart';

class UIConstants {
  static AppBar appBar(context) {
    var theme = Theme.of(context);

    return AppBar(
      title: const Text(AppConstants.name),
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
    );
  }
}
