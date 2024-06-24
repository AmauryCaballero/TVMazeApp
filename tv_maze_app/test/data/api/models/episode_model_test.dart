import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze_app/data/api/models/episode_model.dart';
import 'package:tv_maze_app/domain/entities/episode.dart';

void main() {
  const tEpisodeModel = EpisodeModel(
    id: 1,
    name: 'Test Episode',
    season: 1,
    number: 1,
    summary: 'Summary',
    image: {'medium': 'url'},
  );

  test('should be a subclass of Episode entity', () {
    expect(tEpisodeModel.toDomain(), isA<Episode>());
  });

  test('fromJson should return a valid model', () {
    final Map<String, dynamic> jsonMap = {
      "id": 1,
      "name": "Test Episode",
      "season": 1,
      "number": 1,
      "summary": "Summary",
      "image": {"medium": "url"}
    };

    final result = EpisodeModel.fromJson(jsonMap);

    expect(result, tEpisodeModel);
  });

  test('toJson should return a JSON map containing the proper data', () {
    final result = tEpisodeModel.toJson();

    final expectedJsonMap = {
      "id": 1,
      "name": "Test Episode",
      "season": 1,
      "number": 1,
      "summary": "Summary",
      "image": {"medium": "url"}
    };

    expect(result, expectedJsonMap);
  });
}
