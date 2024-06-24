import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tv_maze_app/core/errors/exceptions.dart';
import 'package:tv_maze_app/data/api/models/series_model.dart';
import 'package:tv_maze_app/data/api/tvmaze_api_service.dart';
import 'package:tv_maze_app/data/datasources/series_remote_data_source.dart';

import 'series_remote_data_source_test.mocks.dart';

@GenerateMocks([TvMazeApiService])
void main() {
  late SeriesRemoteDataSourceImpl dataSource;
  late MockTvMazeApiService mockApiService;

  setUp(() {
    mockApiService = MockTvMazeApiService();
    dataSource = SeriesRemoteDataSourceImpl(mockApiService);
  });

  group('getAllSeries', () {
    final tPage = 1;
    final tSeriesModel = SeriesModel(
        id: 1,
        name: 'Test Series',
        summary: 'Summary',
        image: {'medium': 'url'});
    final tSeriesModelList = [tSeriesModel];

    test('should return List<SeriesModel> when the call to API is successful',
        () async {
      // arrange
      when(mockApiService.getAllSeries(tPage))
          .thenAnswer((_) async => tSeriesModelList);
      // act
      final result = await dataSource.getAllSeries(tPage);
      // assert
      verify(mockApiService.getAllSeries(tPage));
      expect(result, equals(tSeriesModelList));
    });

    test('should throw a ServerException when the call to API is unsuccessful',
        () async {
      // arrange
      when(mockApiService.getAllSeries(tPage)).thenThrow(ServerException());
      // act
      final call = dataSource.getAllSeries;
      // assert
      expect(() => call(tPage), throwsA(isA<ServerException>()));
    });
  });
}
