import 'package:json_annotation/json_annotation.dart';

part 'series_model.g.dart';

@JsonSerializable()
class SeriesModel {
  final int id;
  final String name;
  final String? summary;
  final String? image;

  SeriesModel({
    required this.id,
    required this.name,
    this.summary,
    this.image,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesModelToJson(this);
}
