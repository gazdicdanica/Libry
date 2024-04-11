import 'package:bloc/bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LibrariesRepository _repository;

  SearchBloc(this._repository) : super(SearchInitial()) {
    on<LibrariesSearched>(_searchLibraries);
    on<ResetSearch>(_resetSearchState);
  }

  void _searchLibraries(
      LibrariesSearched event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      final libraries = await _repository.getCurrentLibraires(event.searchText);
      emit(SearchSuccess(libraries));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

  void _resetSearchState(ResetSearch event, Emitter<SearchState> emit) {
    emit(SearchInitial());
  }
}
