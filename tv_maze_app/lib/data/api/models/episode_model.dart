import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  final int id;
  final String name;
  final int season;
  final int number;
  final String? summary;
  final String? image;

  EpisodeModel({
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
}
