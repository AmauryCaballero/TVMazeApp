import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final int id;
  final String name;
  final String? summary;
  final Map<String, dynamic>? image;

  const Series({
    required this.id,
    required this.name,
    this.summary,
    this.image,
  });

  @override
  List<Object?> get props => [id, name, summary, image];
}
