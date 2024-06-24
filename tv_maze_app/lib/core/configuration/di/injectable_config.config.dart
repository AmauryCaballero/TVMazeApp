// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tv_maze_app/core/configuration/di/injectable_config.dart'
    as _i18;
import 'package:tv_maze_app/core/network/network_info.dart' as _i7;
import 'package:tv_maze_app/data/api/tvmaze_api_service.dart' as _i9;
import 'package:tv_maze_app/data/datasources/series_local_data_source.dart'
    as _i8;
import 'package:tv_maze_app/data/datasources/series_remote_data_source.dart'
    as _i10;
import 'package:tv_maze_app/domain/repositories/series_repository.dart' as _i11;
import 'package:tv_maze_app/domain/repositories/series_repository_impl.dart'
    as _i12;
import 'package:tv_maze_app/domain/usecases/get_all_series.dart' as _i17;
import 'package:tv_maze_app/domain/usecases/get_episode_details.dart' as _i16;
import 'package:tv_maze_app/domain/usecases/get_episodes_by_series.dart'
    as _i15;
import 'package:tv_maze_app/domain/usecases/get_series_details.dart' as _i13;
import 'package:tv_maze_app/domain/usecases/search_series.dart' as _i14;
import 'package:tv_maze_app/presentation/blocs/splash/bloc/splash_bloc.dart'
    as _i3;

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
    gh.factory<_i3.SplashBloc>(() => registerModule.splashBloc);
    gh.lazySingleton<_i4.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i5.Box<dynamic>>(() => registerModule.box);
    gh.lazySingleton<_i6.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i7.NetworkInfo>(
        () => _i7.NetworkInfoImpl(gh<_i4.Connectivity>()));
    gh.lazySingleton<_i8.SeriesLocalDataSource>(
        () => _i8.SeriesLocalDataSourceImpl(box: gh<_i5.Box<dynamic>>()));
    gh.lazySingleton<_i9.TvMazeApiService>(() => _i9.TvMazeApiService(
          gh<_i6.Dio>(),
          baseUrl: gh<String>(),
        ));
    gh.lazySingleton<_i10.SeriesRemoteDataSource>(
        () => _i10.SeriesRemoteDataSourceImpl(gh<_i9.TvMazeApiService>()));
    gh.lazySingleton<_i11.SeriesRepository>(() => _i12.SeriesRepositoryImpl(
          remoteDataSource: gh<_i10.SeriesRemoteDataSource>(),
          localDataSource: gh<_i8.SeriesLocalDataSource>(),
          networkInfo: gh<_i7.NetworkInfo>(),
        ));
    gh.lazySingleton<_i13.GetSeriesDetails>(
        () => _i13.GetSeriesDetails(gh<_i11.SeriesRepository>()));
    gh.lazySingleton<_i14.SearchSeries>(
        () => _i14.SearchSeries(gh<_i11.SeriesRepository>()));
    gh.lazySingleton<_i15.GetEpisodesBySeries>(
        () => _i15.GetEpisodesBySeries(gh<_i11.SeriesRepository>()));
    gh.lazySingleton<_i16.GetEpisodeDetails>(
        () => _i16.GetEpisodeDetails(gh<_i11.SeriesRepository>()));
    gh.lazySingleton<_i17.GetAllSeries>(
        () => _i17.GetAllSeries(gh<_i11.SeriesRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
