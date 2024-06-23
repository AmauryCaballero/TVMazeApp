import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'models/episode_model.dart';
import 'models/search_result_model.dart';
import 'models/series_model.dart';

part 'tvmaze_api_service.g.dart';

@RestApi(baseUrl: "https://api.tvmaze.com")
abstract class TvMazeApiService {
  factory TvMazeApiService(Dio dio, {String baseUrl}) = _TvMazeApiService;

  @GET("/shows")
  Future<List<SeriesModel>> getAllSeries(@Query("page") int page);

  @GET("/search/shows")
  Future<List<SearchResultModel>> searchSeries(@Query("q") String query);

  @GET("/shows/{id}")
  Future<SeriesModel> getSeriesDetails(@Path("id") int id);

  @GET("/shows/{id}/episodes")
  Future<List<EpisodeModel>> getEpisodesBySeries(@Path("id") int seriesId);

  @GET("/episodes/{id}")
  Future<EpisodeModel> getEpisodeDetails(@Path("id") int episodeId);
}
