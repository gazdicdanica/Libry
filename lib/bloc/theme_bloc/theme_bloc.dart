
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/data/shared_preferences/prefs_repository/prefs_repository.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  final PrefsRepository _prefsRepository;

  ThemeBloc(this._prefsRepository) : super(ThemeInitial()) {
    on<ChangeTheme>(_changeTheme);
  }

  void _changeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    _prefsRepository.saveTheme(event.themeMode.toString());
    emit(ThemeChanged(event.themeMode));
  }
}
