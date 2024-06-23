import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/series.dart';
import '../repositories/series_repository.dart';

class GetSeriesDetails implements UseCase<Series, int> {
  final SeriesRepository repository;

  GetSeriesDetails(this.repository);

  @override
  Future<Either<Failure, Series>> call(int id) async {
    return await repository.getSeriesDetails(id);
  }
}
