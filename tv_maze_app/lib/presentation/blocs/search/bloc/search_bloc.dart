import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/debounce_mixin.dart';
import '../../../../domain/entities/series.dart';
import '../../../../domain/usecases/search_series.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> with Debounce {
  final SearchSeries searchSeries;

  SearchBloc({required this.searchSeries}) : super(SearchInitial()) {
    on<PerformSearch>((event, emit) async {
      await debounce(() => _onPerformSearch(event, emit));
    });
  }

  Future<void> _onPerformSearch(
      PerformSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await searchSeries(event.query);
    result.fold(
      (failure) => emit(const SearchError("Failed to search series")),
      (seriesList) => emit(SearchLoaded(seriesList)),
    );
  }

  @override
  Future<void> close() {
    disposeDebounce();
    return super.close();
  }
}
