part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Series> seriesList;
  final bool hasReachedMax;

  const HomeLoaded(this.seriesList, {this.hasReachedMax = false});

  @override
  List<Object> get props => [seriesList, hasReachedMax];

  HomeLoaded copyWith({
    List<Series>? seriesList,
    bool? hasReachedMax,
  }) {
    return HomeLoaded(
      seriesList ?? this.seriesList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
