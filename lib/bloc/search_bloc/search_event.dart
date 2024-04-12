part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class LibrariesSearched extends SearchEvent {
  final String searchText;
  final String sort;

  LibrariesSearched(this.searchText, this.sort);
}

final class ResetSearch extends SearchEvent {}
