
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/utils/shared_preferences_util.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeTheme>(_changeTheme);
  }

  SharedPreferencesUtil prefs = SharedPreferencesUtil();

  void _changeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    prefs.saveTheme(event.themeMode.toString());
    emit(ThemeChanged(event.themeMode));
  }
}
