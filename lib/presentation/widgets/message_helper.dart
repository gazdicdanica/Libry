import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class MessageHelper {
  static void showSnackBarMessage(BuildContext context, FavoritesState state) {
    final t = Translations.of(context);
    
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    String message = '';
    if (state is FavoritesSucess) {
      message = t.add_favorites;
    } else if (state is FavoritesRemoveSucess) {
      message = t.remove_favorites;
    } else if (state is FavoritesFailure) {
      message = t.error_favorites;
    } else if (state is FavoriteNoInternet) {
      message = t.internet_error;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}