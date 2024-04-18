import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/favorites/favorites_list.dart';

class FavoritesScreen extends StatelessWidget {

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user= FirebaseAuth.instance.currentUser;
   
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
        ),
         body:  SafeArea(
          child:StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
            .collection('favorites')
            .doc(user?.uid)
            .collection('libraries')
            .snapshots(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                return const FavoritesList(libraries: []);
             }
             final List<Library> favoriteLibraries= snapshot.data!.docs
                .map((doc) => Library(
                  name:doc['name'],
                  latestReleaseNumber: doc['latestRelaseNumber'],
                  keywords: List<String>.from(doc['keywords']),
                  isFavorite:doc['isFavorite'],
                   platformColor: (doc['colorHex']),
                         contributionsCount: null, 
                        dependentReposCount: null, 
                        description: '', 
                        dependentsCount: null, 
                        forks: null, 
                        homepage: '', 
                        language: '', 
                        latestDownloadUrl: '', 
                        platform: '', 
                        rank: null,
                  )).toList();
                  return FavoritesList( libraries: favoriteLibraries,);
            },),),
          
      ),
    );
   
  }
}
