import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:tv_maze_app/core/utils/assets_extension.dart';

import '../../blocs/splash/bloc/splash_bloc.dart';
import '../../routes/app_router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetIt.instance<SplashBloc>()..add(LoadInitialData()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is LoadedState) {
            context.router.replace(HomeRoute(seriesList: state.seriesList));
          }
        },
        child: Scaffold(
          body: Center(
            child: Lottie.asset(
              'tv_splash_animation'.jsonLottie,
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}
