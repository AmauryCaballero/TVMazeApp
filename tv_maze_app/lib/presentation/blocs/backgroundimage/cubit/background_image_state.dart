part of 'background_image_cubit.dart';

abstract class BackgroundImageState extends Equatable {
  const BackgroundImageState();

  @override
  List<Object> get props => [];
}

class BackgroundImageInitial extends BackgroundImageState {}

class BackgroundImageChanged extends BackgroundImageState {
  final String imageUrl;

  const BackgroundImageChanged(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}
