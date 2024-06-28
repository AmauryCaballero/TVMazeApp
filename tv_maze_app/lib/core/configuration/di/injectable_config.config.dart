// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i8;
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tv_maze_app/core/configuration/di/injectable_config.dart'
    as _i21;
import 'package:tv_maze_app/core/network/network_info.dart' as _i12;
import 'package:tv_maze_app/core/theme/app_theme.dart' as _i3;
import 'package:tv_maze_app/data/api/tvmaze_api_service.dart' as _i11;
import 'package:tv_maze_app/data/datasources/series_local_data_source.dart'
    as _i13;
import 'package:tv_maze_app/data/datasources/series_remote_data_source.dart'
    as _i15;
import 'package:tv_maze_app/domain/repositories/series_repository.dart' as _i14;
import 'package:tv_maze_app/domain/usecases/get_all_series.dart' as _i16;
import 'package:tv_maze_app/domain/usecases/get_episode_details.dart' as _i19;
import 'package:tv_maze_app/domain/usecases/get_episodes_by_series.dart'
    as _i17;
import 'package:tv_maze_app/domain/usecases/get_series_details.dart' as _i18;
import 'package:tv_maze_app/domain/usecases/search_series.dart' as _i20;
import 'package:tv_maze_app/presentation/blocs/backgroundimage/cubit/background_image_cubit.dart'
    as _i6;
import 'package:tv_maze_app/presentation/blocs/home/bloc/home_bloc.dart' as _i5;
import 'package:tv_maze_app/presentation/blocs/search/bloc/search_bloc.dart'
    as _i7;
import 'package:tv_maze_app/presentation/blocs/splash/bloc/splash_bloc.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.ThemeBloc>(() => registerModule.themeBloc);
    gh.factory<_i4.SplashBloc>(() => registerModule.splashBloc);
    gh.factory<_i5.HomeBloc>(() => registerModule.homeBloc);
    gh.factory<_i6.BackgroundImageCubit>(
        () => registerModule.backgroundImageCubit);
    gh.factory<_i7.SearchBloc>(() => registerModule.serarchBloc);
    gh.lazySingleton<_i8.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i9.Box<dynamic>>(() => registerModule.box);
    gh.lazySingleton<_i10.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i11.TvMazeApiService>(
        () => registerModule.tvMazeApiService);
    gh.lazySingleton<_i12.NetworkInfo>(() => registerModule.networkInfo);
    gh.lazySingleton<_i13.SeriesLocalDataSource>(
        () => registerModule.localDataSource);
    gh.lazySingleton<_i14.SeriesRepository>(
        () => registerModule.seriesRepository);
    gh.lazySingleton<_i15.SeriesRemoteDataSource>(
        () => registerModule.seriesRemoteDataSource);
    gh.lazySingleton<_i16.GetAllSeries>(
        () => registerModule.getAllSeriesUseCase);
    gh.lazySingleton<_i17.GetEpisodesBySeries>(
        () => registerModule.getEpisodesBySeriesUseCase);
    gh.lazySingleton<_i18.GetSeriesDetails>(
        () => registerModule.getSeriesDetailsUseCase);
    gh.lazySingleton<_i19.GetEpisodeDetails>(
        () => registerModule.getEpisodeDetailsUseCase);
    gh.lazySingleton<_i20.SearchSeries>(
        () => registerModule.searchSeriesUseCase);
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
