part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class LibrariesSearched extends SearchEvent {
  final String searchText;

  LibrariesSearched(this.searchText);
}

final class ResetSearch extends SearchEvent {}
