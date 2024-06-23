import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_colors.dart';
part 'light_theme.dart';
part 'dark_theme.dart';
part 'theme_bloc.dart';

final class AppTheme {
  static ThemeData get lightTheme => _LightTheme.themeData;
  static ThemeData get darkTheme => _DarkTheme.themeData;
}
