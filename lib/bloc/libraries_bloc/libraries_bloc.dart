import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter/foundation.dart';

part 'libraries_event.dart';
part 'libraries_state.dart';

class LibrariesBloc extends Bloc<LibrariesEvent, LibrariesState> {
  final LibrariesRepository _librariesRepository;
  LibrariesBloc(this._librariesRepository) : super(LibrariesInitial()) {
    on<FetchLibraries>(_getCurrentLibraries);
  }
  void _getCurrentLibraries(
    FetchLibraries event,
    Emitter<LibrariesState> emit,
  ) async {
    emit(LibrariesLoading());
    try {
      final libraries = await _librariesRepository.getCurrentLibraires(
          event.platform, event.sort);
      emit(LibrariesSuccess(libraries));
    } catch (e) {
      emit(LibrariesFailure(e.toString()));
    }
  }
}
