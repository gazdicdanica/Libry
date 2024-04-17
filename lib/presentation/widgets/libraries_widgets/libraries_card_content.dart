import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/screens/favorites_screen.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LibrariesCardContet extends StatelessWidget {
  const LibrariesCardContet({super.key, required this.library});

  final Library library;

  @override
  Widget build(BuildContext context) {
    bool position = MediaQuery.of(context).orientation == Orientation.portrait;
    double screenWidth = MediaQuery.of(context).size.width;
    double remainigWidth = screenWidth * 0.2 ;
    List<String> keywords = [];
    String keywordsString = '';
    //final _firestore= FirebaseStorage.instance;


    for (String keyword in library.keywords!) {
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

    void addToFavorite(Library library){
      // try{
      //   User? user= FirebaseAuth.instance.currentUser;
      //   final firestoreInstance=FirebaseStorage.instance
      //   .ref()
      //   .child('user_favorites');


      // }catch (e){
      //     ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Greška prilikom dodavanja u favorite')),
      // );
      // }
    }


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
                    library.name!,
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
                          Image.asset(
                            'assets/Conversion_path.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width:  position ? 100 : 150,
                            child: Text(
                              library.latestReleaseNumber!,
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
                                    color: textColor,
                                    size: 24),
                            
                            SizedBox(
                              child: Text(
                                keywordsString,
                                style: Theme.of(context).textTheme.bodyMedium,
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
            const SizedBox(width: 5,),
             SizedBox(
              width: 10,
              child: ElevatedButton(
                child:  const Icon (Icons.favorite,
                  color:Color.fromARGB(255, 72, 75, 73)),
                   onPressed:() {
                   addToFavorite(library);
                            },
              ),
            ),
        ],
      ),
    );
  }
}
