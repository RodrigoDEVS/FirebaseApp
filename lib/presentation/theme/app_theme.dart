import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const Color seedColor = Colors.tealAccent;

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    );
  }
}
