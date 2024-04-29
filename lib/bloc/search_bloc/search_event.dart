part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class LibrariesSearched extends SearchEvent {
  final String searchText;
  final String sort;
  final int page;

  LibrariesSearched(this.searchText, this.sort, this.page);
}

final class ResetSearch extends SearchEvent {}
