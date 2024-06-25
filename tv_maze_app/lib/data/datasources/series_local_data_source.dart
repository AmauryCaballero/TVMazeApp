import 'package:hive_flutter/hive_flutter.dart';

import '../../core/errors/exceptions.dart';
import '../api/models/series_model.dart';

abstract class SeriesLocalDataSource {
  Future<List<SeriesModel>> getLastSeries();
  Future<void> cacheSeries(List<SeriesModel> seriesToCache);
}

class SeriesLocalDataSourceImpl implements SeriesLocalDataSource {
  final Box box;

  SeriesLocalDataSourceImpl({required this.box});

  @override
  Future<List<SeriesModel>> getLastSeries() {
    final seriesList = box.get('cachedSeries', defaultValue: []);
    if (seriesList.isNotEmpty) {
      return Future.value(List<SeriesModel>.from(seriesList));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheSeries(List<SeriesModel> seriesToCache) {
    return box.put('cachedSeries', seriesToCache);
  }
}
