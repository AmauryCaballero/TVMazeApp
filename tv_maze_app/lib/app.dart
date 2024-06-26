import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_app/core/theme/app_theme.dart';
import 'package:tv_maze_app/presentation/blocs/home/bloc/home_bloc.dart';
import 'package:tv_maze_app/presentation/blocs/search/bloc/search_bloc.dart';
import 'package:tv_maze_app/presentation/blocs/splash/bloc/splash_bloc.dart';

import 'core/configuration/di/injectable_config.dart';
import 'presentation/blocs/backgroundimage/cubit/background_image_cubit.dart';
import 'presentation/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => getIt<ThemeBloc>(),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => getIt<SplashBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider<BackgroundImageCubit>(
          create: (context) => getIt<BackgroundImageCubit>(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => getIt<SearchBloc>(),
        )
      ],
      child: const AppWithThemeObserver(),
    );
  }
}

class AppWithThemeObserver extends StatefulWidget {
  const AppWithThemeObserver({super.key});

  @override
  State<AppWithThemeObserver> createState() => _AppWithThemeObserverState();
}

class _AppWithThemeObserverState extends State<AppWithThemeObserver>
    with WidgetsBindingObserver {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    context.read<ThemeBloc>().add(ThemeEvent.system);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(
            navigatorObservers: () => [AutoRouteObserver()],
          ),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
        );
      },
    );
  }
}
