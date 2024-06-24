import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/episode.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel extends Equatable {
  final int id;
  final String name;
  final int season;
  final int number;
  final String? summary;
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
