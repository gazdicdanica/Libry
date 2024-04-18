import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class FavoritesList extends StatefulWidget{
  final List<Library> libraries;

  const FavoritesList({super.key, required this.libraries});

  @override
  State<StatefulWidget> createState() {
    
    return _FavoritesListState();
  }
}

class _FavoritesListState extends State<FavoritesList>{
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.libraries.isEmpty ?
           const Padding(
             padding: EdgeInsets.fromLTRB(20, 230, 20, 20),
             child: Center(
              child: Column(children: 
              [
               SizedBox(
                width: 70,
                 child:  Icon(Icons.emoji_nature_outlined,
                        size: 90, color: textColor)
               ),
                 SizedBox(height: 20,),
                 Text('There are no favorite packages yet!',
                    style:  TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Text('If you want to receive updates about your favorite packages, add it to favorites by pressing star icon. ',
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,)
              ]),
                       ),
           )
       : Center(
            child: ListView.builder(
                itemCount: widget.libraries.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    color: widget.libraries[index].colorObj,
                    onTap: () {},
                    child: LibrariesCardContet(
                      library: widget.libraries[index],
                    ),
                  );
                }),
          ),

   );
  }

}