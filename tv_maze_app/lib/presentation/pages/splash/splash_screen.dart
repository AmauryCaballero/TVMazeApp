import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../blocs/splash/bloc/splash_bloc.dart';
import '../../routes/app_router.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetIt.instance<SplashBloc>()..add(LoadInitialData()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is LoadedState) {
            context.router.replace(const HomeRoute());
          }
        },
        child: const Scaffold(),
      ),
    );
  }
}
