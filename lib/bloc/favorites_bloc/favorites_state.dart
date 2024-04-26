part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState{}
final class FavoritesSucess extends FavoritesState{}
final class FavoritesFailure extends FavoritesState{}
final class FavoritesRemoveSucess extends FavoritesState{}
final class FavoritesRemoveFailure extends FavoritesState{}
final class FavoriteNoInternet extends FavoritesState{}
final class FavoritesCheckStatusSucess extends FavoritesState{}
final class FavoritesCheckStatusFailure extends FavoritesState{}
