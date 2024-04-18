import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/library_info_widget.dart';
import 'package:intl/intl.dart';

class DetailsWidget extends StatelessWidget {
  final Library library;
  const DetailsWidget({super.key, required this.library});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LibraryInfo(
            label: "Repository status", value: library.repositoryStatus!),
        LibraryInfo(label: "Platform", value: library.platform!),
        LibraryInfo(label: "Language", value: library.language!),
        LibraryInfo(label: "Stars", value: library.stars.toString()),
        LibraryInfo(
            label: "Latest release number",
            value: library.latestReleaseNumber!),
        LibraryInfo(
            label: "Published at",
            value: _formatDate(library.latestReleasePublishedAt)),
        LibraryInfo(
            label: "Latest stable release",
            value: library.latestStableReleaseNumber!),
        LibraryInfo(
            label: "Published at",
            value: _formatDate(library.latestStableReleasePublishedAt)),
      ],
    );
  }

  String _formatDate(String? dateString) {
    if (dateString != null && dateString.isNotEmpty) {
      return DateFormat('dd.MM.yyyy, HH:mm').format(DateTime.parse(dateString));
    } else {
      return '';
    }
  }
}
