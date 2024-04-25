import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/info_container_widget.dart';
import 'package:intl/intl.dart';

class DetailsWidget extends StatelessWidget {
  final Library library;
  const DetailsWidget({super.key, required this.library});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoContainers(labels: [
          t.repo_status,
          t.platform,
          t.language,
          t.license,
          t.stars,
          t.latest_release_num,
          t.published_at,
          t.latest_stable_release,
          t.published_at,
        ], values: [
          library.repositoryStatus ?? "/",
          library.platform ?? "/",
          library.language ?? "/",
          library.license ?? "/",
          library.stars.toString(),
          library.latestReleaseNumber ?? "/",
          _formatDate(library.latestReleasePublishedAt),
          library.latestStableReleaseNumber ?? "/",
          _formatDate(library.latestStableReleasePublishedAt),
        ]),
      ],
    );
  }

  String _formatDate(String? dateString) {
    if (dateString != null && dateString.isNotEmpty) {
      return DateFormat('dd.MM.yyyy, HH:mm').format(DateTime.parse(dateString));
    } else {
      return '/';
    }
  }
}
