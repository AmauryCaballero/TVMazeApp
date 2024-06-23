part of 'app_theme.dart';

class _DarkTheme {
  static ThemeData get themeData => _darkTheme;

  static final ThemeData _darkTheme = ThemeData(
    colorScheme: _colorScheme,
    primaryColor: _AppColors.primary,
    hintColor: _AppColors.secondary,
    scaffoldBackgroundColor: _AppColors.darkBackground,
    canvasColor: _AppColors.darkBackground,
    cardColor: _AppColors.darkSurface,
    buttonTheme: _buttomTheme,
    textTheme: _textTheme,
    appBarTheme: _appbarTheme,
    iconTheme: _iconTheme,
    inputDecorationTheme: _inputDecorationTheme,
    floatingActionButtonTheme: _fABThemeData,
    dividerTheme: _dividerThemeData,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
  );

  static const ButtonThemeData _buttomTheme = ButtonThemeData(
    buttonColor: _AppColors.primary,
    textTheme: ButtonTextTheme.primary,
  );

  static const ColorScheme _colorScheme = ColorScheme.dark(
    primary: _AppColors.primary,
    primaryContainer: _AppColors.primaryVariant,
    secondary: _AppColors.secondary,
    secondaryContainer: _AppColors.secondaryVariant,
    surface: _AppColors.darkSurface,
    error: _AppColors.darkError,
    onPrimary: _AppColors.darkOnPrimary,
    onSecondary: _AppColors.darkOnSecondary,
    onSurface: _AppColors.darkOnSurface,
    onError: _AppColors.darkOnError,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(color: _AppColors.darkOnBackground),
    displayMedium: TextStyle(color: _AppColors.darkOnBackground),
    displaySmall: TextStyle(color: _AppColors.darkOnBackground),
    headlineMedium: TextStyle(color: _AppColors.darkOnBackground),
    headlineSmall: TextStyle(color: _AppColors.darkOnBackground),
    titleLarge: TextStyle(color: _AppColors.darkOnBackground),
    titleMedium: TextStyle(color: _AppColors.darkOnSurface),
    titleSmall: TextStyle(color: _AppColors.darkOnSurface),
    bodyLarge: TextStyle(color: _AppColors.darkOnSurface),
    bodyMedium: TextStyle(color: _AppColors.darkOnSurface),
    bodySmall: TextStyle(color: _AppColors.darkOnSurface),
    labelLarge: TextStyle(color: _AppColors.darkOnSurface),
    labelSmall: TextStyle(color: _AppColors.darkOnSurface),
  );

  static const AppBarTheme _appbarTheme = AppBarTheme(
    color: _AppColors.primary,
    iconTheme: IconThemeData(color: _AppColors.darkOnPrimary),
  );

  static const IconThemeData _iconTheme = IconThemeData(
    color: _AppColors.darkOnSurface,
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: _AppColors.darkSurface,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: _AppColors.primary),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: _AppColors.primaryVariant),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: _AppColors.darkError),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: _AppColors.darkError),
    ),
    labelStyle: const TextStyle(color: _AppColors.darkOnSurface),
    hintStyle: TextStyle(color: _AppColors.darkOnSurface.withOpacity(0.6)),
  );

  static const FloatingActionButtonThemeData _fABThemeData =
      FloatingActionButtonThemeData(
    backgroundColor: _AppColors.primary,
    foregroundColor: _AppColors.darkOnPrimary,
  );

  static final DividerThemeData _dividerThemeData = DividerThemeData(
    color: _AppColors.darkOnSurface.withOpacity(0.2),
    thickness: 1,
  );

  static final BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: _AppColors.darkSurface,
    selectedItemColor: _AppColors.primary,
    unselectedItemColor: _AppColors.darkOnSurface.withOpacity(0.6),
  );
}
