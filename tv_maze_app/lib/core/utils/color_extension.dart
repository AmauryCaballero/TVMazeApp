import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color get toColor {
    final hexCode = replaceAll("#", "");
    return Color(int.parse("FF$hexCode", radix: 16));
  }
}

extension ColorBrightness on Color {
  bool get isDark =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.dark;

  bool get isLight =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light;
}
