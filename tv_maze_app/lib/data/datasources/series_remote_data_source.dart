import '../../core/errors/exceptions.dart';
import '../api/models/episode_model.dart';
import '../api/models/series_model.dart';
import '../api/tvmaze_api_service.dart';

abstract class SeriesRemoteDataSource {
  Future<List<SeriesModel>> getAllSeries(int page);
  Future<List<SeriesModel>> searchSeries(String query);
  Future<SeriesModel> getSeriesDetails(int id);
  Future<List<EpisodeModel>> getEpisodesBySeries(int seriesId);
  Future<EpisodeModel> getEpisodeDetails(int episodeId);
}

class SeriesRemoteDataSourceImpl implements SeriesRemoteDataSource {
  final TvMazeApiService apiService;

  SeriesRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<SeriesModel>> getAllSeries(int page) async {
    try {
      return await apiService.getAllSeries(page);
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<List<SeriesModel>> searchSeries(String query) async {
    try {
      final searchResults = await apiService.searchSeries(query);
      return searchResults.map((result) => result.show).toList();
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<SeriesModel> getSeriesDetails(int id) async {
    try {
      return await apiService.getSeriesDetails(id);
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<List<EpisodeModel>> getEpisodesBySeries(int seriesId) async {
    try {
      return await apiService.getEpisodesBySeries(seriesId);
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<EpisodeModel> getEpisodeDetails(int episodeId) async {
    try {
      return await apiService.getEpisodeDetails(episodeId);
    } catch (error) {
      throw ServerException();
    }
  }
}
