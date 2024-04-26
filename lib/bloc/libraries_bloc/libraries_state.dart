part of'libraries_bloc.dart';

@immutable

sealed class LibrariesState extends Equatable{
}

final class LibrariesInitial extends LibrariesState{
  @override
  List<Object?> get props => [];
}

final class LibrariesSuccess extends LibrariesState{
  final List<Library> libraries;

  LibrariesSuccess(this.libraries);
  
  @override
  List<Object?> get props => [libraries];

}

final class LibrariesFailure extends LibrariesState{
  final String error;

  LibrariesFailure(this.error);
  
  @override
  List<Object?> get props => [error];
}

final class LibrariesLoading extends LibrariesState{
  @override
  List<Object?> get props => [];
}