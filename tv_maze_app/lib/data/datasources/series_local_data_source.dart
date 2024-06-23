import '../../core/errors/exceptions.dart';
import '../api/models/series_model.dart';

abstract class SeriesLocalDataSource {
  Future<List<SeriesModel>> getLastSeries();
  Future<void> cacheSeries(List<SeriesModel> seriesToCache);
}

class SeriesLocalDataSourceImpl implements SeriesLocalDataSource {
  // Assuming you have some local storage solution (like shared_preferences or hive)
  // Here we'll just use a placeholder for demonstration

  @override
  Future<List<SeriesModel>> getLastSeries() {
    throw CacheException(); // Just a placeholder
  }

  @override
  Future<void> cacheSeries(List<SeriesModel> seriesToCache) {
    return Future.value();
  }
}
