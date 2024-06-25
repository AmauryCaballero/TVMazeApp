import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/assets_extension.dart';
import '../../../domain/entities/series.dart';
import '../../blocs/backgroundimage/cubit/background_image_cubit.dart';
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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Stack(
                children: [
                  BlocBuilder<BackgroundImageCubit, BackgroundImageState>(
                    builder: (context, backgroundImageState) {
                      if (backgroundImageState is BackgroundImageChanged) {
                        return _buildBackgroundImage(
                            backgroundImageState.imageUrl);
                      }
                      return Container();
                    },
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        color: Theme.of(context).canvasColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  _buildCarousel(state.seriesList, context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildCarousel(List<Series> seriesList, BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
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
          onPageChanged: (index, reason) {
            final series = seriesList[index];
            if (series.image?.original != null) {
              context
                  .read<BackgroundImageCubit>()
                  .changeBackgroundImage(series.image?.original ?? '');
            }
          },
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(String? imageUrl) {
    return imageUrl != null
        ? Positioned.fill(
            child: Transform.scale(
              scale: 1.5,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: CachedNetworkImage(
                  key: ValueKey<String>(imageUrl),
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Lottie.asset(
                    'tv_placeholder_animation'.jsonLottie,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          )
        : Container();
  }
}
