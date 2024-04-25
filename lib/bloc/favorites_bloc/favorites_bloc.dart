

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/check_internet.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final Library? library;
  final User user;
   late StreamSubscription _subscription;

  final _favoriteLibrariesController = StreamController<List<Library>>();

  Stream<List<Library>> get favoriteLibrariesStream =>
      _favoriteLibrariesController.stream;


  FavoritesBloc(this.library,this.user) : super(FavoritesInitial()) {
    on<FavoritesAdd>(_addFavorites);
    on<FavoriteRemove>(_removeFavorites);
   on<FavoritesCheckStatus>(_checkFavoriteStatus);
    _fetchFavoriteLibraries();
  }

  void _fetchFavoriteLibraries() {
    _subscription = FirebaseFirestore.instance
        .collection('favorites')
        .doc(user.uid)
        .collection('libraries')
        .snapshots()
        .listen((snapshot) {
      List<Library> favoriteLibraries = snapshot.docs.map((doc) {
        return Library(
          name: doc['name'],
          latestReleaseNumber: doc['latestRelaseNumber'],
          keywords: List<String>.from(doc['keywords']),
          isFavorite: doc['isFavorite'],
          platformColor: doc['colorHex'],
          contributionsCount: null,
          dependentReposCount: null,
          description: doc['description'],
          dependentsCount: null,
          forks: null,
          homepage: doc['homepage'],
          language: doc['language'],
          latestDownloadUrl: '',
          platform: doc['platform'],
          rank: doc['rank'],
          license: doc['license'],
          latestStableReleaseNumber: doc['latestStableReleaseNumber'],
          latestStableReleasePublishedAt:
              doc['latestStableReleasePublishedAt'],
          latestReleasePublishedAt: doc['latestReleasePublishedAt'],
          repositoryStatus: doc['repositoryStatus'],
          stars: doc['stars'],
        );
      }).toList();
      _favoriteLibrariesController.sink.add(favoriteLibraries);
    });
  }

  void _removeFavorites(
      FavoriteRemove event, Emitter<FavoritesState> emit) async {
        emit(FavoritesInitial());
    try {
      bool isConnected = await checkInternetConnection();

      if (!isConnected) {
        emit(FavoriteNoInternet());
        return;
      }
        String userId = user.uid;
        String libraryName =
            event.library.name!.replaceAll(RegExp(r'[^\w\s]+'), '');

        await FirebaseFirestore.instance
            .collection('favorites')
            .doc(userId)
            .collection('libraries')
            .doc(libraryName)
            .delete();
        emit(FavoritesRemoveSucess());
      
    } catch (e) {
      emit(FavoritesFailure());
    }
  }

  void _addFavorites(FavoritesAdd event, Emitter<FavoritesState> emit) async 
  {
     emit(FavoritesInitial());
    try {
      bool isConnected = await checkInternetConnection();

      if (!isConnected) {
        emit(FavoriteNoInternet());
        return;
      }
        String userId = user.uid;
        String libraryName = library!.name!.replaceAll(RegExp(r'[^\w\s]+'), '');
        await FirebaseFirestore.instance
            .collection('favorites')
            .doc(userId)
            .collection('libraries')
            .doc(libraryName)
            .set({
          'name': library!.name,
          'description': library!.description,
          'latestRelaseNumber': library!.latestReleaseNumber,
          'keywords': library!.keywords,
          'isFavorite': true,
          'colorHex': library!.platformColor,
          'homepage': library!.homepage,
          'repositoryStatus': library!.repositoryStatus,
          'platform': library!.platform,
          'language': library!.language,
          'license': library!.license,
          'stars': library!.stars,
          'rank': library!.rank,
          'latestReleaseNumber': library!.latestReleaseNumber,
          'latestReleasePublishedAt': library!.latestReleasePublishedAt,
          'latestStableReleaseNumber': library!.latestStableReleaseNumber,
          'latestStableReleasePublishedAt':
              library!.latestStableReleasePublishedAt,
        });
        emit(FavoritesSucess());
      
    } catch (e) {
      emit(FavoritesFailure());
    }
  }
  void _checkFavoriteStatus(FavoritesCheckStatus event, Emitter<FavoritesState> emit) async {
  
    try{
        String userId = user.uid;
        String libraryName =
            library!.name!.replaceAll(RegExp(r'[^\w\s]+'), '');
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('favorites')
            .doc(userId)
            .collection('libraries')
            .doc(libraryName)
            .get();
        if (doc.exists) {
            library!.isFavorite = true;
        } else {
        library!.isFavorite = false;
        
        
    } emit( FavoritesCheckStatusSucess());
    } catch (e){
         emit(FavoritesFailure());
    }
    
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _favoriteLibrariesController.close();
    return super.close();
  }
  
}
