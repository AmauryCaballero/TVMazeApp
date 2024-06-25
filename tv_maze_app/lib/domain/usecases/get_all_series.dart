import 'package:dartz/dartz.dart';
import 'package:tv_maze_app/core/errors/failures.dart';
import 'package:tv_maze_app/core/usecases/usecase.dart';

import '../entities/series.dart';
import '../repositories/series_repository.dart';

class GetAllSeries implements UseCase<List<Series>, int> {
  final SeriesRepository repository;

  GetAllSeries(this.repository);

  @override
  Future<Either<Failure, List<Series>>> call(int page) async {
    return await repository.getAllSeries(page);
  }
}
