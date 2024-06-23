import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final String name;
  final int season;
  final int number;
  final String? summary;
  final Map<String, dynamic>? image;

  const Episode({
    required this.id,
    required this.name,
    required this.season,
    required this.number,
    this.summary,
    this.image,
  });

  @override
  List<Object?> get props => [id, name, season, number, summary, image];
}
