import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/series.dart';
import '../pages/home/home_screen.dart';
import '../pages/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
