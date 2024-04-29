import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_webview/library_webview_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/message_helper.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class LibraryHeaderDetails extends StatefulWidget {
  final Library library;
  const LibraryHeaderDetails({super.key, required this.library});

  @override
  State<LibraryHeaderDetails> createState() => _LibraryHeaderDetailsState();
}

class _LibraryHeaderDetailsState extends State<LibraryHeaderDetails> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc(widget.library, user!),
      child: BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {
          if (state is FavoritesSucess) {
            setState(() {
              widget.library.isFavorite = true;
            });
            MessageHelper.showSnackBarMessage(context, state);
          } else if (state is FavoritesRemoveSucess) {
            setState(() {
              widget.library.isFavorite = false;
            });
            MessageHelper.showSnackBarMessage(context, state);
          } else if (state is FavoritesFailure || state is FavoriteNoInternet) {
            MessageHelper.showSnackBarMessage(context, state);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 45,
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 12,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.25),
                      width: 1.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.library.name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          key: K.webView,
                          icon: const Icon(Icons.link),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LibraryWebView(
                                      url: widget.library.homepage!)),
                            );
                          },
                          padding: const EdgeInsets.only(bottom: 2),
                        ),
                        IconButton(
                          key: K.favorite,
                          icon: widget.library.isFavorite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            widget.library.isFavorite
                                ? context
                                    .read<FavoritesBloc>()
                                    .add(FavoriteRemove(widget.library, user!))
                                : context
                                    .read<FavoritesBloc>()
                                    .add(FavoritesAdd(widget.library, user!));
                          },
                          padding: const EdgeInsets.only(bottom: 2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (widget.library.description != null &&
                  widget.library.description!.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 12,
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Text(
                    widget.library.description!,
                    softWrap: true,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
