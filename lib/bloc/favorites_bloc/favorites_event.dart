part of 'favorites_bloc.dart';

@immutable 
sealed class FavoritesEvent{}

final class FavoritesAdd extends FavoritesEvent{
  final Library library;

  FavoritesAdd(this.library);
}

final class FavoriteRemove extends FavoritesEvent{
  final Library library;

  FavoriteRemove(this.library);
}