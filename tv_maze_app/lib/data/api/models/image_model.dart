import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/images.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends Equatable {
  final String? medium;
  final String? original;

  const ImageModel({
    required this.medium,
    required this.original,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  Image toDomain() {
    return Image(medium: medium, original: original);
  }

  @override
  List<Object?> get props => [medium, original];
}
