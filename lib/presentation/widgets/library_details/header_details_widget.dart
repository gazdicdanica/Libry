import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_webview/library_webview_widget.dart';

class LibraryHeaderDetails extends StatelessWidget {
  final Library library;
  const LibraryHeaderDetails({super.key, required this.library});

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
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.25),
                width: 1.5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  library.name!,
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LibraryWebView(url: library.homepage!)),
                      );
                    },
                    padding: const EdgeInsets.only(bottom: 2),
                  ),
                  // IconButton(
                  //   icon: const Icon(Icons.favorite_border),
                  //   onPressed: () {},
                  //   padding: const EdgeInsets.only(bottom: 2),
                  // ),
                ],
              ),
            ],
          ),
        ),
        if (library.description != null && library.description!.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Text(
              library.description!,
              softWrap: true,
            ),
          ),
      ],
    );
  }
}
