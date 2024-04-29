
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/message_helper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class LibrariesCardContet extends StatefulWidget {
  const LibrariesCardContet({super.key, required this.library});

  final Library library;

  @override
  State<LibrariesCardContet> createState() => _LibrariesCardContetState();
}

class _LibrariesCardContetState extends State<LibrariesCardContet> {
  late FavoritesBloc favoritesBloc;
  User? user = FirebaseAuth.instance.currentUser;
  
  @override
  void initState() {
    favoritesBloc= FavoritesBloc(widget.library,user!);
    favoritesBloc.add(FavoritesCheckStatus(widget.library,user!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    bool position = MediaQuery.of(context).orientation == Orientation.portrait;
    double screenWidth = MediaQuery.of(context).size.width;
    double remainigWidth =  screenWidth * 0.2 ;
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
          create: (context) => favoritesBloc,
          child: BlocConsumer<FavoritesBloc, FavoritesState>(
            listener: (context, state) {
              if(state is FavoritesCheckStatusSucess){
                  setState(() {
                    widget.library.isFavorite = widget.library.isFavorite;
                  });
              } 
              if (state is FavoritesSucess) {
                favoritesBloc.add(FavoritesCheckStatus(widget.library,user!));
                MessageHelper.showSnackBarMessage(context, state);
              }  
                if(state is FavoritesRemoveSucess){
                 favoritesBloc.add(FavoritesCheckStatus(widget.library,user!));
                
                MessageHelper.showSnackBarMessage(context, state);
                }
                 if (state is FavoritesFailure  ) {
                  MessageHelper.showSnackBarMessage(context, state);
                  FavoritesInitial();
              }
               if( state is FavoritesRemoveFailure){
                    MessageHelper.showSnackBarMessage(context, state);
                     FavoritesInitial();
              }
               if(state is FavoriteNoInternet){
                 MessageHelper.showSnackBarMessage(context, state);
                   FavoritesInitial();
              }
            },
            builder: (context, state) {
              favoritesBloc.add(FavoritesCheckStatus(widget.library,user!));
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width:position ? screenWidth * 0.6 : screenWidth * 0.7 , 
                      child: Column(
                        key: K.package,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
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
                                   if (widget.library.latestReleaseNumber != null)
                                  Row(children: [
                                    const Icon(Icons.route, size: 20),
                                    SizedBox(
                                      width: position ? 100 : 150,
                                      child: Text(
                                        widget.library.latestReleaseNumber!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ]),
                     if (widget.library.latestReleaseNumber == null)
                                SizedBox(
                                    width: position ? 100 : 150,),

                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      keywordsString == ''
                                          ? const SizedBox()
                                          : Icon(MdiIcons.tag,
                                           size: 20),
                                      SizedBox(
                                        child: Text(
                                          keywordsString,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
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
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          widget.library.isFavorite
                              ? context
                                  .read<FavoritesBloc>()
                                  .add(FavoriteRemove(widget.library,user!),)
                              : context
                                  .read<FavoritesBloc>()
                                  .add(FavoritesAdd(widget.library,user!));
                        },
                        child: Icon(
                          key: K.removeFav,
                          widget.library.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                           color: Theme.of(context).colorScheme.onPrimary,
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
}