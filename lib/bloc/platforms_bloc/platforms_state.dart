part of 'platforms_bloc.dart';

@immutable
sealed class PlatformsState {}

final class PlatformsInitial extends PlatformsState {}

final class PlatformsLoading extends PlatformsState {}

final class PlatformsSuccess extends PlatformsState {
  final List<Platform> platforms;
  
  PlatformsSuccess(this.platforms);
}

final class PlatformsFailure extends PlatformsState {
  final String errorMessage;

  PlatformsFailure(this.errorMessage);
}