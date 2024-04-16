

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/platforms/repository/platforms_repository.dart';
import '../../models/platform.dart';

part 'platforms_event.dart';
part 'platforms_state.dart';

class PlatformsBloc extends Bloc<PlatformsEvent, PlatformsState> {

  final PlatformsRepository _repository;

  PlatformsBloc(this._repository) : super(PlatformsInitial()) {
    on<RequestPlatforms>(_getPlatforms);
  }

  void _getPlatforms(RequestPlatforms event, Emitter<PlatformsState> emit) async {
    emit(PlatformsLoading());

    try{
      final platforms = await _repository.fetchPlatforms();
      emit(PlatformsSuccess(platforms));
    }catch(e){
      emit(PlatformsFailure(e.toString()));
    }

  }
}
