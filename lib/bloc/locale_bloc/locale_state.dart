part of 'locale_bloc.dart';

sealed class LocaleState extends Equatable {
  const LocaleState();
  
  @override
  List<Object> get props => [];
}

final class LocaleInitial extends LocaleState {}

final class LocaleChanged extends LocaleState{
  final AppLocale locale;

  const LocaleChanged(this.locale);

  @override
  List<Object> get props => [locale];
}
