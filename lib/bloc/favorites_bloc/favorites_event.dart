part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

final class FavoritesAdd extends FavoritesEvent {
  final Library library;
  final User user;

  FavoritesAdd(this.library, this.user);
}

final class FavoriteRemove extends FavoritesEvent {
  final Library library;
  final User user;

  FavoriteRemove(this.library, this.user);
}

final class FavoritesCheckStatus extends FavoritesEvent {
  final Library library;
  final User user;

  FavoritesCheckStatus(this.library, this.user);
}
