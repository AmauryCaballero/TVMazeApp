// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchResultModelAdapter extends TypeAdapter<SearchResultModel> {
  @override
  final int typeId = 1;

  @override
  SearchResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchResultModel(
      score: fields[0] as double,
      show: fields[1] as SeriesModel,
    );
  }

  @override
  void write(BinaryWriter writer, SearchResultModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.show);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel(
      score: (json['score'] as num).toDouble(),
      show: SeriesModel.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'score': instance.score,
      'show': instance.show,
    };
