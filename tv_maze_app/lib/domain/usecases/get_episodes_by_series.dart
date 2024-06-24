import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/episode.dart';
import '../repositories/series_repository.dart';

class GetEpisodesBySeries implements UseCase<List<Episode>, int> {
  final SeriesRepository repository;

  GetEpisodesBySeries(this.repository);

  @override
  Future<Either<Failure, List<Episode>>> call(int seriesId) async {
    return await repository.getEpisodesBySeries(seriesId);
  }
}
