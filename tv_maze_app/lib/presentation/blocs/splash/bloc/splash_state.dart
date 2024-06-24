part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class InitialState extends SplashState {}

class LoadingState extends SplashState {}

class LoadedState extends SplashState {
  final List<dynamic> seriesList;

  const LoadedState(this.seriesList);

  @override
  List<Object> get props => [seriesList];
}

class ErrorState extends SplashState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
