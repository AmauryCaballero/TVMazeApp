part of 'app_theme.dart';

enum ThemeEvent { toggle, system }

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(_initialTheme(), _initialThemeMode())) {
    on<ThemeEvent>(_onThemeEvent);
  }

  static ThemeData _initialTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark
        ? _DarkTheme.themeData
        : _LightTheme.themeData;
  }

  static ThemeMode _initialThemeMode() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  void _onThemeEvent(ThemeEvent event, Emitter<ThemeState> emit) {
    if (event == ThemeEvent.toggle) {
      final newThemeMode =
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      emit(ThemeState(
        newThemeMode == ThemeMode.light
            ? _LightTheme.themeData
            : _DarkTheme.themeData,
        newThemeMode,
      ));
    } else if (event == ThemeEvent.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final newThemeData = brightness == Brightness.dark
          ? _DarkTheme.themeData
          : _LightTheme.themeData;
      final newThemeMode =
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
      emit(ThemeState(newThemeData, newThemeMode));
    }
  }

  bool isDarkMode(BuildContext context) {
    if (state.themeMode == ThemeMode.system) {
      final brightness = MediaQuery.of(context).platformBrightness;
      return brightness == Brightness.dark;
    }
    return state.themeMode == ThemeMode.dark;
  }
}

class ThemeState {
  final ThemeData themeData;
  final ThemeMode themeMode;

  ThemeState(this.themeData, this.themeMode);
}
