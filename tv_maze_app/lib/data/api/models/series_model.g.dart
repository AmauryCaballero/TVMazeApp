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
      image: (fields[3] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, SeriesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.summary)
      ..writeByte(3)
      ..write(obj.image);
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
      image: json['image'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SeriesModelToJson(SeriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'summary': instance.summary,
      'image': instance.image,
    };
