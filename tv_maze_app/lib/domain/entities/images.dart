import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? medium;
  final String? original;

  const Image({
    required this.medium,
    required this.original,
  });

  @override
  List<Object?> get props => [medium, original];
}
