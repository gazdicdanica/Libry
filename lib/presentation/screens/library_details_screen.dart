import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/details_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/header_details_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/license_details_widget.dart';

class LibraryDetailsScreen extends StatelessWidget {
  final Library library;

  const LibraryDetailsScreen({super.key, required this.library});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Library details",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
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
              const SizedBox(height: 15),
              LicenseDetails(licenses: library.licenses),
              const SizedBox(height: 15),
              DetailsWidget(library: library),
            ],
          ),
        ),
      )),
    );
  }
}
