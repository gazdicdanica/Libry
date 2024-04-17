import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/utils/shared_preferences_util.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleInitial()) {
    on<ChangeLocale>(_changeLocale);
    on<InitLocale>(_initLocale);
  }

  SharedPreferencesUtil prefs = SharedPreferencesUtil();

  void _initLocale(InitLocale event, Emitter<LocaleState> emit) {
    AppLocale? locale = prefs.getLocale();
    if (locale != null) {
      emit(LocaleChanged(locale));
    } else {
      emit(LocaleInitial());
    }
  }

  void _changeLocale(ChangeLocale event, Emitter<LocaleState> emit) {
    prefs.saveLocale(event.locale.languageCode);
    emit(LocaleChanged(event.locale));
  }
}
