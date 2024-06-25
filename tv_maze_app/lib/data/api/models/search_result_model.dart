import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'series_model.dart';

part 'search_result_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class SearchResultModel {
  @HiveField(0)
  final double score;

  @HiveField(1)
  final SeriesModel show;

  SearchResultModel({
    required this.score,
    required this.show,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}
