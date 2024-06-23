// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      season: (json['season'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      summary: json['summary'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'summary': instance.summary,
      'image': instance.image,
    };
