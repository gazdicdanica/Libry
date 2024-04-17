part of 'locale_bloc.dart';

sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

final class InitLocale extends LocaleEvent {}

final class ChangeLocale extends LocaleEvent {
  final AppLocale locale;

  const ChangeLocale(this.locale);

  @override
  List<Object> get props => [locale];
}
