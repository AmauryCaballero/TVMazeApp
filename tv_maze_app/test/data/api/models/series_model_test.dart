import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze_app/data/api/models/series_model.dart';
import 'package:tv_maze_app/domain/entities/series.dart';

void main() {
  const tSeriesModel = SeriesModel(
    id: 1,
    name: 'Test Series',
    summary: 'Summary',
  );

  test('should be a subclass of Series entity', () {
    expect(tSeriesModel.toDomain(), isA<Series>());
  });

  test('fromJson should return a valid model', () {
    final Map<String, dynamic> jsonMap = {
      "id": 1,
      "name": "Test Series",
      "summary": "Summary",
      "image": {"medium": "url"}
    };

    final result = SeriesModel.fromJson(jsonMap);

    expect(result, tSeriesModel);
  });

  test('toJson should return a JSON map containing the proper data', () {
    final result = tSeriesModel.toJson();

    final expectedJsonMap = {
      "id": 1,
      "name": "Test Series",
      "summary": "Summary",
      "image": {"medium": "url"}
    };

    expect(result, expectedJsonMap);
  });
}
