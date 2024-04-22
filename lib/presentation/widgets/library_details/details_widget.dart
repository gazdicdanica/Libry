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
        _buildInfoContainers(context, [
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

  Widget _buildInfoContainers(
      BuildContext context, List<String> labels, List<String> values) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
            decoration: const BoxDecoration(
              color: lightGreenColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: labels.asMap().entries.map((entry) {
                return Row(
                  children: [
                    LabelWidget(
                      label: entry.value,
                      isLastInRow: entry.key == labels.length - 1,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
              ),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.25),
                  width: 1,
                ),
                top: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.25),
                  width: 0.5,
                ),
                left: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.25),
                  width: 2,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(-2, 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: values.asMap().entries.map((entry) {
                return Row(
                  children: [
                    LabelWidget(
                      label: entry.value,
                      isLastInRow: entry.key == labels.length - 1,
                    ),
                  ],
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
