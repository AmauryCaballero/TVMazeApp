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

class LoadMoreSeries extends HomeEvent {
  final int page;

  const LoadMoreSeries(this.page);

  @override
  List<Object> get props => [page];
}
