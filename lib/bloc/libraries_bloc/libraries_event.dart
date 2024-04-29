part of 'libraries_bloc.dart';

@immutable
sealed class LibrariesEvent {}

class FetchLibraries extends LibrariesEvent {
  final String platform;
  final String sort;
  final int page;

  FetchLibraries(this.platform, this.sort, this.page);
}
