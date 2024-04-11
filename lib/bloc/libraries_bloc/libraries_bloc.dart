import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/data/libraries/repository/libraries_repository.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter/foundation.dart';

part 'libraries_event.dart';
part 'libraries_state.dart';

class LibrariesBloc extends Bloc<LibrariesEvent,LibrariesState>{
  final LibrariesRepository _librariesRepository;
  LibrariesBloc(this._librariesRepository) : super(LibrariesInitial()){

    on<LibrairesFetched>(_getCurrentLibraries);
  }
    void _getCurrentLibraries(
          LibrairesFetched event,
          Emitter<LibrariesState> emit,)  
      async{
        try{
         emit(LibrariesLoading());
          final libraries= await _librariesRepository.getCurrentLibraires(event.platform);
          emit(LibrariesSuccess(libraries));
        }
        catch (e){
            emit(LibrariesFailure(e.toString()));
        }
          
    }
}