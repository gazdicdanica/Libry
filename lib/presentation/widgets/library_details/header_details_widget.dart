import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class LibraryHeaderDetails extends StatefulWidget {
  final Library library;
  const LibraryHeaderDetails({super.key, required this.library});

  @override
  State<LibraryHeaderDetails> createState() => _LibraryHeaderDetailsState();
}

class _LibraryHeaderDetailsState extends State<LibraryHeaderDetails> {
  @override
  Widget build(BuildContext context) {
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
          decoration: const BoxDecoration(
            color: lightGreenColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
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
                    icon: const Icon(Icons.link),
                    onPressed: () {},
                    padding: const EdgeInsets.only(bottom: 2),
                  ),
                  IconButton(
                    icon: widget.library.isFavorite ? const  Icon(Icons.favorite) :  const Icon(Icons.favorite_border), 
                    onPressed: () {
                      setState(() {
                    widget.library.isFavorite = !widget.library.isFavorite;
                     addToFavorite(widget.library);
                  }); 
                    },
                    padding: const EdgeInsets.only(bottom: 2),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (widget.library.description != null && widget.library.description!.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: 12,
            ),
            decoration: const BoxDecoration(
              color: lightGreyColor,
            ),
            child: Text(
              widget.library.description!,
              softWrap: true,
            ),
          ),
      ],
    );
  }

     void addToFavorite(Library library){
       final t=Translations.of(context);
      try{
        User? user=FirebaseAuth.instance.currentUser;
        if(user != null){
          String userId=user.uid;
          String libraryName=  library.name!.replaceAll(RegExp(r'[^\w\s]+'), '');
          if(!widget.library.isFavorite){
            FirebaseFirestore.instance.collection('favorites')
              .doc(userId)
              .collection('libraries')
              .doc(libraryName)
              .delete();
                   ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(t.remove_favorites)),
              );
            
              }else{
                FirebaseFirestore.instance.collection('favorites')
                .doc(userId)
                .collection('libraries')
                .doc(libraryName)
                .set({
                'name':library.name,
                'latestRelaseNumber':library.latestReleaseNumber,
                'keywords': library.keywords,
                'isFavorite':true,
                'colorHex':library.platformColor,
                });
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.add_favorites)),
                  );}
        }
      }catch (e){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.error_favorites)),
      );
     } 
    }
}
