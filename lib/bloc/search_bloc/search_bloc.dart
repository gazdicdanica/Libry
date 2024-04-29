import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/models/library.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LibrariesRepository _repository;

  SearchBloc(this._repository) : super(SearchInitial()) {
    on<SearchEvent>(_process, transformer: restartable());
  }

  void _process(SearchEvent event, Emitter<SearchState> emit) async {
    if (event is LibrariesSearched) {
      await _searchLibraries(event, emit);
    } else if (event is ResetSearch) {
      _resetSearchState(event, emit);
    }
  }

  Future<void> _searchLibraries(
      LibrariesSearched event, Emitter<SearchState> emit) async {
    emit(SearchLoading(newSearch: event.page == 1));
    try {
      final libraries = await _repository.getCurrentLibraires(
          event.searchText, event.sort, event.page);
      emit(SearchSuccess(libraries));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

  void _resetSearchState(ResetSearch event, Emitter<SearchState> emit) {
    emit(SearchInitial());
  }
}
