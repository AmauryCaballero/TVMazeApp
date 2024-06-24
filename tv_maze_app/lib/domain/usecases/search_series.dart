import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/series.dart';
import '../repositories/series_repository.dart';

class SearchSeries implements UseCase<List<Series>, String> {
  final SeriesRepository repository;

  SearchSeries(this.repository);

  @override
  Future<Either<Failure, List<Series>>> call(String query) async {
    return await repository.searchSeries(query);
  }
}
