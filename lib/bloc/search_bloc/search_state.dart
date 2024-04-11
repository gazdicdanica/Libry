part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Library> libraries;

  SearchSuccess(this.libraries);
}

final class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}

final class SearchLoading extends SearchState {}
