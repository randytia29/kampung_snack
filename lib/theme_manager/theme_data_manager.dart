import 'package:flutter/material.dart';
import 'package:kampung_snack/theme_manager/color_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
  );
}
