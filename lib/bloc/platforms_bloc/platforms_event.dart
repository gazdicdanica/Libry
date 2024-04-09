part of 'platforms_bloc.dart';

@immutable
sealed class PlatformsEvent {}

final class PlatformsRequested extends PlatformsEvent {}