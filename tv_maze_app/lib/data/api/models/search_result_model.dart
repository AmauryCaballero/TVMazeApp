import 'package:json_annotation/json_annotation.dart';
import 'series_model.dart';

part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultModel {
  final double score;
  final SeriesModel show;

  SearchResultModel({
    required this.score,
    required this.show,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}
