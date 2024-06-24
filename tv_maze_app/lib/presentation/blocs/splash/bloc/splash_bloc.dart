import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../domain/usecases/get_all_series.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetAllSeries getAllSeries;

  SplashBloc({required this.getAllSeries}) : super(InitialState()) {
    on<LoadInitialData>(_onLoadInitialData);
  }

  void _onLoadInitialData(
      LoadInitialData event, Emitter<SplashState> emit) async {
    emit(LoadingState());
    final result = await getAllSeries(1);
    result.fold(
      (failure) => emit(ErrorState(_mapFailureToMessage(failure))),
      (seriesList) => emit(LoadedState(seriesList)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'Server Failure';
      case NoConnectionFailure _:
        return 'No Connection';
      default:
        return 'Unexpected Error';
    }
  }
}
