import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../data/datasources/series_local_data_source.dart';
import '../../data/datasources/series_remote_data_source.dart';
import '../entities/episode.dart';
import '../entities/series.dart';
import 'series_repository.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesRemoteDataSource remoteDataSource;
  final SeriesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  SeriesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Series>>> getAllSeries(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSeries = await remoteDataSource.getAllSeries(page);
        return Right(remoteSeries.map((model) => model.toDomain()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSeries = await localDataSource.getLastSeries();
        return Right(localSeries.map((model) => model.toDomain()).toList());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Series>>> searchSeries(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSeries = await remoteDataSource.searchSeries(query);
        return Right(remoteSeries.map((model) => model.toDomain()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Series>> getSeriesDetails(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSeries = await remoteDataSource.getSeriesDetails(id);
        return Right(remoteSeries.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Episode>>> getEpisodesBySeries(
      int seriesId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteEpisodes =
            await remoteDataSource.getEpisodesBySeries(seriesId);
        return Right(remoteEpisodes.map((model) => model.toDomain()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Episode>> getEpisodeDetails(int episodeId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteEpisode =
            await remoteDataSource.getEpisodeDetails(episodeId);
        return Right(remoteEpisode.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
