import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/screens/library_details_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_card_content.dart';

class FavoritesList extends StatefulWidget {
  final List<Library> libraries;

  const FavoritesList({super.key, required this.libraries});

  @override
  State<StatefulWidget> createState() {
    return _FavoritesListState();
  }
}

class _FavoritesListState extends State<FavoritesList> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return SafeArea(
      child: widget.libraries.isEmpty
          ? Padding(
              padding: const EdgeInsets.fromLTRB(20, 230, 20, 20),
              child: Center(
                child: Column(children: [
                  const SizedBox(
                      width: 70,
                      child: Icon(Icons.emoji_nature_outlined,
                          size: 90,)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    t.no_favorites,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    t.explanation_adding,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ]),
              ),
            )
          : Center(
              child: ListView.builder(
                  itemCount: widget.libraries.length,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      color: widget.libraries[index].colorObj,
                      onTap: () {
                        _goToDetailsScreen(widget.libraries[index]);
                      },
                      child: LibrariesCardContet(
                        library: widget.libraries[index],
                      ),
                    );
                  }),
            ),
    );
  }

  void _goToDetailsScreen(Library library) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LibraryDetailsScreen(
          library: library,
        ),
      ),
    );
  }
}
