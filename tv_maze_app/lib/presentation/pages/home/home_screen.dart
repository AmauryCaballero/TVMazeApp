import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/series.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  final List<Series> seriesList;

  const HomeScreen({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
