part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {
  final List<Series> seriesList;

  const LoadHomeData(this.seriesList);

  @override
  List<Object> get props => [seriesList];
}
