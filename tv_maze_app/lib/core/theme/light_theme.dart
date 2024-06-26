part of 'app_theme.dart';

class _LightTheme {
  static ThemeData get themeData => _lightTheme;

  static final ThemeData _lightTheme = ThemeData(
    colorScheme: _colorScheme,
    primaryColor: _AppColors.primary,
    hintColor: _AppColors.secondary,
    scaffoldBackgroundColor: _AppColors.background,
    canvasColor: _AppColors.background,
    cardColor: _AppColors.surface,
    buttonTheme: _buttomTheme,
    textTheme: _textTheme,
    appBarTheme: _appBarTheme,
    iconTheme: const IconThemeData(
      color: _AppColors.onSurface,
    ),
    inputDecorationTheme: _inputDecorationTheme,
    floatingActionButtonTheme: _fABThemeData,
    dividerTheme: _dividerTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
  );

  static const ButtonThemeData _buttomTheme = ButtonThemeData(
    buttonColor: _AppColors.primary,
    textTheme: ButtonTextTheme.primary,
  );

  static const ColorScheme _colorScheme = ColorScheme.light(
    primary: _AppColors.primary,
    primaryContainer: _AppColors.primaryVariant,
    secondary: _AppColors.secondary,
    secondaryContainer: _AppColors.secondaryVariant,
    surface: _AppColors.surface,
    error: _AppColors.error,
    onPrimary: _AppColors.onPrimary,
    onSecondary: _AppColors.onSecondary,
    onSurface: _AppColors.onSurface,
    onError: _AppColors.onError,
  );

  static final DividerThemeData _dividerTheme = DividerThemeData(
    color: _AppColors.onSurface.withOpacity(0.2),
    thickness: 1,
  );

  static final BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: _AppColors.surface,
    selectedItemColor: _AppColors.primary,
    unselectedItemColor: _AppColors.onSurface.withOpacity(0.6),
  );

  static const FloatingActionButtonThemeData _fABThemeData =
      FloatingActionButtonThemeData(
    backgroundColor: _AppColors.primary,
    foregroundColor: _AppColors.onPrimary,
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: _AppColors.surface.withOpacity(0.5),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: _AppColors.primary),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: _AppColors.primaryVariant),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: _AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: _AppColors.error),
    ),
    labelStyle: const TextStyle(color: _AppColors.onSurface),
    hintStyle: TextStyle(color: _AppColors.onSurface.withOpacity(0.6)),
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    color: _AppColors.primary,
    iconTheme: IconThemeData(color: _AppColors.onPrimary),
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(color: _AppColors.onBackground),
    displayMedium: TextStyle(color: _AppColors.onBackground),
    displaySmall: TextStyle(color: _AppColors.onBackground),
    headlineMedium: TextStyle(color: _AppColors.onBackground),
    headlineSmall: TextStyle(color: _AppColors.onBackground),
    titleLarge: TextStyle(color: _AppColors.onBackground),
    titleMedium: TextStyle(color: _AppColors.onSurface),
    titleSmall: TextStyle(color: _AppColors.onSurface),
    bodyLarge: TextStyle(color: _AppColors.onSurface),
    bodyMedium: TextStyle(color: _AppColors.onSurface),
    bodySmall: TextStyle(color: _AppColors.onSurface),
    labelLarge: TextStyle(color: _AppColors.onPrimary),
    labelSmall: TextStyle(color: _AppColors.onSurface),
  );
}
