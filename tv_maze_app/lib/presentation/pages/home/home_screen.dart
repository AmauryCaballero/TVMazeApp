import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/assets_extension.dart';
import '../../../domain/entities/series.dart';
import '../../blocs/home/bloc/home_bloc.dart';

part 'widgets/home_series_card.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  final List<Series> seriesList;

  const HomeScreen({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomeData(seriesList)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('TV Series'),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeLoaded) {
              return buildCarousel(state.seriesList);
            }
            return Container();
          })),
    );
  }

  Widget buildCarousel(List<Series> seriesList) {
    return CarouselSlider.builder(
      itemCount: seriesList.length,
      itemBuilder: (context, index, realIndex) {
        final serie = seriesList[index];
        return _HomeSeriesCard(
          key: Key(serie.hashCode.toString()),
          serie: serie,
        );
      },
      options: CarouselOptions(
        height: 400,
        viewportFraction: 0.7,
        enlargeFactor: 0.2,
        enlargeCenterPage: true,
        pageSnapping: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
    );
  }
}
