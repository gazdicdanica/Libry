part of 'libraries_bloc.dart';

@immutable
sealed class LibrariesEvent{}

class LibrairesFetched extends LibrariesEvent {
  final String platform; 

  LibrairesFetched(this.platform);

}
