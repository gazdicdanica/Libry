import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class LibrariesCardContet extends StatefulWidget {
  const LibrariesCardContet({super.key, required this.library});

  final Library library;

  @override
  State<LibrariesCardContet> createState() => _LibrariesCardContetState();
}

class _LibrariesCardContetState extends State<LibrariesCardContet> {
  @override
  void initState() {
    checkFavoriteStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkFavoriteStatus();
    bool position = MediaQuery.of(context).orientation == Orientation.portrait;
    double screenWidth = MediaQuery.of(context).size.width;
    double remainigWidth = screenWidth * 0.2;
    List<String> keywords = [];
    String keywordsString = '';

    for (String keyword in widget.library.filteredKeywords!) {
      TextPainter textPainter = TextPainter(
        text: TextSpan(text: keyword),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      double keywordWidth = textPainter.width + 8.0;
      if (keywordWidth <= remainigWidth) {
        keywords.add(keyword);
        remainigWidth -= keywordWidth;
      } else {
        break;
      }
    }
    keywordsString = keywords.join(',');

    return BlocProvider(
      create: (context) => FavoritesBloc(widget.library),
      child: BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {
          if (state is FavoritesSucess) {
            checkFavoriteStatus();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(t.add_favorites)),
            );
          } else if (state is FavoritesRemoveSucess) {
            checkFavoriteStatus();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(t.remove_favorites)),
            );
          } else if (state is FavoritesFailure) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(t.error_favorites)),
            );
          } else if (state is FavoriteNoInternet) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(t.internet_error)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: position ? 250 : 500,
                      child: Text(
                        widget.library.name!,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Row(children: [
                              Icon(MdiIcons.sourceRepository, size: 20),
                              SizedBox(
                                width: position ? 100 : 150,
                                child: Text(
                                  widget.library.latestReleaseNumber!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                            const SizedBox(
                              width: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                keywordsString == ''
                                    ? const SizedBox()
                                    : Icon(MdiIcons.tag,
                                        color: textColor, size: 20),
                                SizedBox(
                                  child: Text(
                                    keywordsString,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: () {
                      widget.library.isFavorite
                          ? context
                              .read<FavoritesBloc>()
                              .add(FavoriteRemove(widget.library))
                          : context
                              .read<FavoritesBloc>()
                              .add(FavoritesAdd(widget.library));
                    },
                    child: Icon(
                      widget.library.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color.fromARGB(255, 72, 75, 73),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void checkFavoriteStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      String libraryName =
          widget.library.name!.replaceAll(RegExp(r'[^\w\s]+'), '');
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .collection('libraries')
          .doc(libraryName)
          .get();
      if (doc.exists) {
        setState(() {
          widget.library.isFavorite = true;
        });
      } else {
        setState(() {
          widget.library.isFavorite = false;
        });
      }
    }
  }
}
