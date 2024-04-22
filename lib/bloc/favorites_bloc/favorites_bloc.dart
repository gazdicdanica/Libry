import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';

part  'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState>
{
  final Library? library;


    FavoritesBloc(this.library): super(FavoritesInitial()){

    on<FavoritesAdd>(_addFavorites);
   on<FavoriteRemove>(_removeFavorites);

  }
  
  void _removeFavorites(FavoriteRemove event, Emitter<FavoritesState> emit) async {

    try{
      bool isConnected = await checkInternetConnection(); 

      if (!isConnected) {
        emit(FavoriteNoInternet());
        return;
      }

        User? user=FirebaseAuth.instance.currentUser;
        if(user != null){
          String userId=user.uid;
          String libraryName=  event.library.name!.replaceAll(RegExp(r'[^\w\s]+'), '');
  
         await FirebaseFirestore.instance.collection('favorites')
              .doc(userId)
              .collection('libraries')
              .doc(libraryName)
              .delete();
              emit(FavoritesRemoveSucess());
            
            }
            }catch (e){
              emit(FavoritesFailure());
            }
  }

    void  _addFavorites(FavoritesAdd event, Emitter<FavoritesState> emit) async {
    
    try{
      bool isConnected = await checkInternetConnection(); 

      if (!isConnected) {
        emit(FavoriteNoInternet());
        return;
      }

        User? user=FirebaseAuth.instance.currentUser;
        if(user != null){
          String userId=user.uid;
          String libraryName=  library!.name!.replaceAll(RegExp(r'[^\w\s]+'), '');
              await  FirebaseFirestore.instance.collection('favorites')
                .doc(userId)
                .collection('libraries')
                .doc(libraryName)
                .set({
                'name':library!.name,
                'latestRelaseNumber':library!.latestReleaseNumber,
                'keywords': library!.keywords,
                'isFavorite':true,
                'colorHex':library!.platformColor,
                });
                   emit(FavoritesSucess());
                      }    
            }catch (e){
              emit(FavoritesFailure());
            }
  }
   
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false; 
      }
    } on SocketException catch (_) {
      return false; 
    }
  }
}