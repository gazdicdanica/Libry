import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/label_widget.dart';
import 'package:flutter_internship_2024_app/theme.dart';
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
        _buildInfoContainers([
          t.repo_status,
          t.platform,
          t.language,
          t.license,
          t.stars,
          t.latest_release_num,
          t.published_at,
          t.latest_stable_release,
          t.published_at,
        ], [
          library.repositoryStatus!,
          library.platform!,
          library.language!,
          library.license!,
          library.stars.toString(),
          library.latestReleaseNumber!,
          _formatDate(library.latestReleasePublishedAt),
          library.latestStableReleaseNumber!,
          _formatDate(library.latestStableReleasePublishedAt),
        ]),
      ],
    );
  }

  Widget _buildInfoContainers(List<String> labels, List<String> values) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 22),
            decoration: const BoxDecoration(
              color: lightGreenColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: labels.map((label) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: LabelWidget(label: label),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 22),
            decoration: const BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: values.map((value) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: LabelWidget(label: value),
                );
              }).toList(),
            ),
          ),
        ),
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
