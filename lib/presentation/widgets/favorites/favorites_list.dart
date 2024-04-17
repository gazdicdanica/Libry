import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';

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
          const Center(
            child: Text('No favorite'),
          )
       : Center(
            child: ListView.builder(
                itemCount: widget.libraries.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    color: Colors.black,
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