import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/rating.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final double? average;

  const RatingModel({this.average});

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);

  Rating toDomain() => Rating(average: average);
}
