import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/details_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/header_details_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/keywords_details_widget.dart';

class LibraryDetailsScreen extends StatelessWidget {
  final Library library;

  const LibraryDetailsScreen({super.key, required this.library});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            t.library_details,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LibraryHeaderDetails(library: library),
            const SizedBox(height: 7),
            KeywordsDetails(keywords: library.filteredKeywords),
            const SizedBox(height: 10),
            DetailsWidget(library: library),
          ],
        ),
      ))),
    );
  }
}
