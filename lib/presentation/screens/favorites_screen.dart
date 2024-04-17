import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/favorites/favorites_list.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/tab_bar.dart';

class FavoritesScreen extends StatelessWidget {

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user= FirebaseAuth.instance.currentUser;
    final List<Library> libraries=[];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Favorites',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          centerTitle: false,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: TabBarWidget(),
          ),
        ),
         body:  SafeArea(child: FavoritesList( libraries: libraries,)),
      ),
    );
  }
}
