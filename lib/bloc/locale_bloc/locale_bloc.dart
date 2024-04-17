import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleInitial()) {
    on<ChangeLocale>(_changeLocale);
    on<InitLocale>(_initLocale);
  }

  void _initLocale(InitLocale event, Emitter<LocaleState> emit) {
    emit(LocaleInitial());
  }

  void _changeLocale(ChangeLocale event, Emitter<LocaleState> emit) {
    emit(LocaleChanged(event.locale));
  }
}
