part of'libraries_bloc.dart';

@immutable

sealed class LibrariesState{
}

final class LibrariesInitial extends LibrariesState{}

final class LibrariesSuccess extends LibrariesState{
  final List<Library> libraries;

  LibrariesSuccess(this.libraries);

}

final class LibrariesFailure extends LibrariesState{
  final String error;

  LibrariesFailure(this.error);
}

final class LibrariesLoading extends LibrariesState{}