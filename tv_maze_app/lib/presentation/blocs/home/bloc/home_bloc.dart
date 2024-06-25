import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/series.dart';
import '../../../../domain/usecases/get_all_series.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllSeries getAllSeries;

  HomeBloc({required this.getAllSeries}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<LoadMoreSeries>(_onLoadMoreSeries);
  }

  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoaded(event.seriesList));
  }

  void _onLoadMoreSeries(LoadMoreSeries event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && !currentState.hasReachedMax) {
      final result = await getAllSeries(event.page);
      result.fold(
        (failure) => emit(const HomeError("Failed to load more series")),
        (seriesList) {
          if (seriesList.isEmpty) {
            emit(currentState.copyWith(hasReachedMax: true));
          } else {
            emit(HomeLoaded(
              currentState.seriesList + seriesList,
              hasReachedMax: false,
            ));
          }
        },
      );
    }
  }
}
