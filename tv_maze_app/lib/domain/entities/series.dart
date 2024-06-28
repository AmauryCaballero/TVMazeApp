import 'package:equatable/equatable.dart';

import 'images.dart';
import 'rating.dart';

class Series extends Equatable {
  final int id;

  final String name;

  final String summary;

  final Image image;

  final int? updated;

  final String? officialSite;

  final List<String> genres;

  final Rating? rating;

  final String premiered;

  const Series({
    required this.id,
    required this.name,
    required this.summary,
    required this.image,
    this.updated,
    this.officialSite,
    required this.genres,
    required this.rating,
    required this.premiered,
  });

  @override
  List<Object?> get props => [id, name, summary];
}
