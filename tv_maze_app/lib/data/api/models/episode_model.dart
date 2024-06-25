import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/episode.dart';

part 'episode_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class EpisodeModel extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int season;

  @HiveField(3)
  final int number;

  @HiveField(4)
  final String? summary;

  @HiveField(5)
  final Map<String, dynamic>? image;

  const EpisodeModel({
    required this.id,
    required this.name,
    required this.season,
    required this.number,
    this.summary,
    this.image,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);

  Episode toDomain() {
    return Episode(
      id: id,
      name: name,
      season: season,
      number: number,
      summary: summary,
      image: image,
    );
  }

  @override
  List<Object?> get props => [id, name, season, number, summary, image];
}
