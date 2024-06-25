import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:tv_maze_app/core/theme/app_theme.dart';
import 'package:tv_maze_app/presentation/blocs/home/bloc/home_bloc.dart';
import 'package:tv_maze_app/presentation/blocs/search/bloc/search_bloc.dart';

import '../../../domain/usecases/get_episodes_by_series.dart';
import '../../../domain/usecases/get_series_details.dart';
import '../../../domain/usecases/search_series.dart';
import '../../../presentation/blocs/backgroundimage/cubit/background_image_cubit.dart';
import '../../network/network_info.dart';
import '../../../data/datasources/series_local_data_source.dart';
import '../../../domain/repositories/series_repository_impl.dart';
import '../../../presentation/blocs/splash/bloc/splash_bloc.dart';
import '../../../data/api/tvmaze_api_service.dart';
import '../../../data/datasources/series_remote_data_source.dart';
import '../../../domain/repositories/series_repository.dart';
import '../../../domain/usecases/get_all_series.dart';
import '../../../domain/usecases/get_episode_details.dart';
import 'injectable_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  Box<dynamic> get box => Hive.box('tvMazeBox');

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  TvMazeApiService get tvMazeApiService => TvMazeApiService(dio);

  @lazySingleton
  NetworkInfo get networkInfo => NetworkInfoImpl(connectivity);

  @lazySingleton
  SeriesLocalDataSource get localDataSource =>
      SeriesLocalDataSourceImpl(box: box);

  @lazySingleton
  SeriesRepository get seriesRepository => SeriesRepositoryImpl(
      remoteDataSource: seriesRemoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo);

  @lazySingleton
  SeriesRemoteDataSource get seriesRemoteDataSource =>
      SeriesRemoteDataSourceImpl(tvMazeApiService);

  @lazySingleton
  GetAllSeries get getAllSeriesUseCase => GetAllSeries(seriesRepository);

  @lazySingleton
  GetEpisodesBySeries get getEpisodesBySeriesUseCase =>
      GetEpisodesBySeries(seriesRepository);

  @lazySingleton
  GetSeriesDetails get getSeriesDetailsUseCase =>
      GetSeriesDetails(seriesRepository);

  @lazySingleton
  GetEpisodeDetails get getEpisodeDetailsUseCase =>
      GetEpisodeDetails(seriesRepository);

  @lazySingleton
  SearchSeries get searchSeriesUseCase => SearchSeries(seriesRepository);

  @factory
  ThemeBloc get themeBloc => ThemeBloc();

  @factory
  SplashBloc get splashBloc => SplashBloc(getAllSeries: getAllSeriesUseCase);

  @factory
  HomeBloc get homeBloc => HomeBloc(getAllSeries: getAllSeriesUseCase);

  @factory
  BackgroundImageCubit get backgroundImageCubit => BackgroundImageCubit();

  @factory
  SearchBloc get serarchBloc => SearchBloc(searchSeries: searchSeriesUseCase);
}
