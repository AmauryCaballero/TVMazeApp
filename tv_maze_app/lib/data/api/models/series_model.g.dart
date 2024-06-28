// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriesModelAdapter extends TypeAdapter<SeriesModel> {
  @override
  final int typeId = 0;

  @override
  SeriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesModel(
      id: fields[0] as int,
      name: fields[1] as String,
      summary: fields[2] as String?,
      image: fields[3] as ImageModel?,
      updated: fields[4] as int?,
      officialSite: fields[5] as String?,
      genres: (fields[6] as List?)?.cast<String>(),
      rating: fields[7] as RatingModel?,
      premiered: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SeriesModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.summary)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.officialSite)
      ..writeByte(6)
      ..write(obj.genres)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.premiered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesModel _$SeriesModelFromJson(Map<String, dynamic> json) => SeriesModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      summary: json['summary'] as String?,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      updated: (json['updated'] as num?)?.toInt(),
      officialSite: json['officialSite'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      premiered: json['premiered'] as String?,
    );

Map<String, dynamic> _$SeriesModelToJson(SeriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'summary': instance.summary,
      'image': instance.image,
      'updated': instance.updated,
      'officialSite': instance.officialSite,
      'genres': instance.genres,
      'rating': instance.rating,
      'premiered': instance.premiered,
    };
