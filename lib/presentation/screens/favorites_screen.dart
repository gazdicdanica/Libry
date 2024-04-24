
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/favorites/favorites_list.dart';

class FavoritesScreen extends StatelessWidget {
   FavoritesScreen({super.key});
    final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final FavoritesBloc favoritesBloc = FavoritesBloc(null,user!);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              t.navigation_favorites,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          centerTitle: false,
          shape: const Border(
            bottom:
                BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
          ),
        ),
        body: SafeArea(
          child:   StreamBuilder<List<Library>>(
            stream: favoritesBloc.favoriteLibrariesStream,
            builder: (context,snapshot){
              if(snapshot.connectionState ==ConnectionState.waiting)
              {
                            return const Center(
                      child: CircularProgressIndicator(),
                    );
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const FavoritesList(libraries: []);
              }
              return FavoritesList(libraries: snapshot.data!);
            }
          // StreamBuilder<QuerySnapshot>(
          //   stream: FirebaseFirestore.instance
          //       .collection('favorites')
          //       .doc(user?.uid)
          //       .collection('libraries')
            //     .snapshots(),
            // builder: (context, snapshot) {
            //   if (snapshot.connectionState == ConnectionState.waiting) {
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   }
            //   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            //     return const FavoritesList(libraries: []);
            //   }
            //   final List<Library> favoriteLibraries = snapshot.data!.docs
            //       .map((doc) => Library(
            //             name: doc['name'],
            //             latestReleaseNumber: doc['latestRelaseNumber'],
            //             keywords: List<String>.from(doc['keywords']),
            //             isFavorite: doc['isFavorite'],
            //             platformColor: doc['colorHex'],
            //             contributionsCount: null,
            //             dependentReposCount: null,
            //             description: doc['description'],
            //             dependentsCount: null,
          //               forks: null,
          //               homepage: doc['homepage'],
          //               language: doc['language'],
          //               latestDownloadUrl: '',
          //               platform: doc['platform'],
          //               rank: doc['rank'],
          //               license: doc['license'],
          //               latestStableReleaseNumber:
          //                   doc['latestStableReleaseNumber'],
          //               latestStableReleasePublishedAt:
          //                   doc['latestStableReleasePublishedAt'],
          //               latestReleasePublishedAt:
          //                   doc['latestReleasePublishedAt'],
          //               repositoryStatus: doc['repositoryStatus'],
          //               stars: doc['stars'],
          //             ))
          //         .toList();
          //     return FavoritesList(
          //       libraries: favoriteLibraries,
          //     );
          //   },
          // ),
        ),
        ),)
    );
  }
}
