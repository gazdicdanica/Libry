import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/data/shared_preferences/prefs_repository/prefs_repository.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final PrefsRepository _prefsRepository;

  LocaleBloc(this._prefsRepository) : super(LocaleInitial()) {
    on<ChangeLocale>(_changeLocale);
    on<InitLocale>(_initLocale);
  }

  

  void _initLocale(InitLocale event, Emitter<LocaleState> emit) {
    AppLocale? locale = _prefsRepository.getLocale();
    if (locale != null) {
      emit(LocaleChanged(locale));
    } else {
      emit(LocaleInitial());
    }
  }

  void _changeLocale(ChangeLocale event, Emitter<LocaleState> emit) async{
    _prefsRepository.saveLocale(event.locale.languageCode);
    await FirebaseAuth.instance.setLanguageCode(event.locale.languageCode);
    emit(LocaleChanged(event.locale));
  }
}
