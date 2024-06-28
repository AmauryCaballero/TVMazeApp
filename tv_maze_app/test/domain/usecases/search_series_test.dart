import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_maze_app/domain/entities/images.dart';
import 'package:tv_maze_app/domain/entities/series.dart';
import 'package:tv_maze_app/domain/repositories/series_repository.dart';
import 'package:tv_maze_app/domain/usecases/search_series.dart';

import 'search_series_test.mocks.dart';

@GenerateMocks([SeriesRepository])
void main() {
  late SearchSeries usecase;
  late MockSeriesRepository mockSeriesRepository;

  setUp(() {
    mockSeriesRepository = MockSeriesRepository();
    usecase = SearchSeries(mockSeriesRepository);
  });

  final tSeries = [
    const Series(
      id: 1,
      name: 'Test Series',
      summary: 'Summary',
      genres: [],
      rating: null,
      image: Image.empty(),
      premiered: '',
    )
  ];
  const tQuery = 'Test';

  test('should search series from the repository', () async {
    // arrange
    when(mockSeriesRepository.searchSeries(any))
        .thenAnswer((_) async => Right(tSeries));
    // act
    final result = await usecase(tQuery);
    // assert
    expect(result, Right(tSeries));
    verify(mockSeriesRepository.searchSeries(tQuery));
    verifyNoMoreInteractions(mockSeriesRepository);
  });
}
