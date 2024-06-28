import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tv_maze_app/data/api/models/image_model.dart';

import '../../../domain/entities/images.dart';
import '../../../domain/entities/series.dart';
import 'rating_model.dart';

part 'series_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class SeriesModel extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? summary;

  @HiveField(3)
  final ImageModel? image;

  @HiveField(4)
  final int? updated;

  @HiveField(5)
  final String? officialSite;

  @HiveField(6)
  final List<String>? genres;

  @HiveField(7)
  final RatingModel? rating;

  @HiveField(8)
  final String? premiered;

  const SeriesModel({
    required this.id,
    required this.name,
    this.summary,
    this.image,
    this.updated,
    this.officialSite,
    this.genres,
    this.rating,
    this.premiered,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesModelToJson(this);

  Series toDomain() {
    return Series(
      id: id,
      name: name,
      summary: summary ?? '',
      image: image?.toDomain() ?? const Image.empty(),
      genres: genres ?? [],
      rating: rating?.toDomain(),
      premiered: premiered ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, summary, image];
}
