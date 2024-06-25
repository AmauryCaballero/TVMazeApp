import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'background_image_state.dart';

class BackgroundImageCubit extends Cubit<BackgroundImageState> {
  BackgroundImageCubit() : super(BackgroundImageInitial());

  void changeBackgroundImage(String imageUrl) {
    emit(BackgroundImageChanged(imageUrl));
  }
}
