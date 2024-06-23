import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/series.dart';

part 'series_model.g.dart';

@JsonSerializable()
class SeriesModel {
  final int id;
  final String name;
  final String? summary;
  final Map<String, dynamic>? image;

  SeriesModel({
    required this.id,
    required this.name,
    this.summary,
    this.image,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesModelToJson(this);

  Series toDomain() {
    return Series(
      id: id,
      name: name,
      summary: summary,
      image: image,
    );
  }
}
