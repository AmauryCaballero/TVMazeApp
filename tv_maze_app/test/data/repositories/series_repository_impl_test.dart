import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_maze_app/core/errors/exceptions.dart';
import 'package:tv_maze_app/core/errors/failures.dart';
import 'package:tv_maze_app/core/network/network_info.dart';
import 'package:tv_maze_app/data/api/models/series_model.dart';
import 'package:tv_maze_app/data/datasources/series_local_data_source.dart';
import 'package:tv_maze_app/data/datasources/series_remote_data_source.dart';
import 'package:tv_maze_app/domain/entities/series.dart';
import 'package:tv_maze_app/domain/repositories/series_repository_impl.dart';

import 'series_repository_impl_test.mocks.dart';

@GenerateMocks([SeriesRemoteDataSource, SeriesLocalDataSource, NetworkInfo])
void main() {
  late SeriesRepositoryImpl repository;
  late MockSeriesRemoteDataSource mockRemoteDataSource;
  late MockSeriesLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockSeriesRemoteDataSource();
    mockLocalDataSource = MockSeriesLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = SeriesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getAllSeries', () {
    const tPage = 1;
    const tSeriesModel = SeriesModel(
        id: 1,
        name: 'Test Series',
        summary: 'Summary',
        image: {'medium': 'url'});

    final List<SeriesModel> tSeriesModelList = [tSeriesModel];

    final List<Series> tSeriesList =
        tSeriesModelList.map((model) => model.toDomain()).toList();

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getAllSeries(tPage);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getAllSeries(tPage))
            .thenAnswer((_) async => tSeriesModelList);
        // act
        final result = await repository.getAllSeries(tPage);
        // assert
        verify(mockRemoteDataSource.getAllSeries(tPage));
        expect(result, equals(Right(tSeriesList)));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getAllSeries(tPage))
            .thenThrow(ServerException());
        // act
        final result = await repository.getAllSeries(tPage);
        // assert
        verify(mockRemoteDataSource.getAllSeries(tPage));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        // arrange
        when(mockLocalDataSource.getLastSeries())
            .thenAnswer((_) async => tSeriesModelList);
        // act
        final result = await repository.getAllSeries(tPage);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastSeries());
        expect(result, equals(Right(tSeriesList)));
      });

      test('should return CacheFailure when there is no cached data present',
          () async {
        // arrange
        when(mockLocalDataSource.getLastSeries()).thenThrow(CacheException());
        // act
        final result = await repository.getAllSeries(tPage);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastSeries());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
