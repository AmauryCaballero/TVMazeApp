import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/episode.dart';
import '../repositories/series_repository.dart';

class GetEpisodeDetails implements UseCase<Episode, int> {
  final SeriesRepository repository;

  GetEpisodeDetails(this.repository);

  @override
  Future<Either<Failure, Episode>> call(int episodeId) async {
    return await repository.getEpisodeDetails(episodeId);
  }
}
