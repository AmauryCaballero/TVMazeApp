import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/series.dart';
import '../entities/episode.dart';

abstract class SeriesRepository {
  Future<Either<Failure, List<Series>>> getAllSeries(int page);
  Future<Either<Failure, List<Series>>> searchSeries(String query);
  Future<Either<Failure, Series>> getSeriesDetails(int id);
  Future<Either<Failure, List<Episode>>> getEpisodesBySeries(int seriesId);
  Future<Either<Failure, Episode>> getEpisodeDetails(int episodeId);
}
