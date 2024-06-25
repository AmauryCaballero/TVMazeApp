import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/series.dart';
import '../../../../domain/usecases/search_series.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchSeries searchSeries;

  SearchBloc({required this.searchSeries}) : super(SearchInitial()) {
    on<PerformSearch>(_onPerformSearch);
  }

  void _onPerformSearch(PerformSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await searchSeries(event.query);
    result.fold(
      (failure) => emit(const SearchError("Failed to search series")),
      (seriesList) => emit(SearchLoaded(seriesList)),
    );
  }
}