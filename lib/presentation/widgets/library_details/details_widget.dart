import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/models/library.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/divider_widget.dart';
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
        _buildInfoContainer(
          label: t.repo_status,
          value: library.repositoryStatus!,
        ),
        _buildInfoContainer(
          label: t.platform,
          value: library.platform!,
        ),
        _buildInfoContainer(
          label: t.language,
          value: library.language!,
        ),
        _buildInfoContainer(
          label: t.license,
          value: library.license!,
        ),
        _buildInfoContainer(
          label: t.stars,
          value: library.stars.toString(),
        ),
        _buildInfoContainer(
          label: t.latest_release_num,
          value: library.latestReleaseNumber!,
        ),
        _buildInfoContainer(
          label: t.published_at,
          value: _formatDate(library.latestReleasePublishedAt),
        ),
        _buildInfoContainer(
          label: t.latest_stable_release,
          value: library.latestStableReleaseNumber!,
        ),
        _buildInfoContainer(
          label: t.published_at,
          value: _formatDate(library.latestStableReleasePublishedAt),
        ),
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

  Widget _buildInfoContainer({
    required String label,
    required String value,
  }) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: lightGreenColor,
                  child: LabelWidget(label: label),
                ),
              ),
              Expanded(
                child: Container(
                  color: lightGreyColor,
                  child: LabelWidget(label: value),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: lightGreenColor,
                  child: const DividerWidget(),
                ),
              ),
              Expanded(
                child: Container(
                  color: lightGreyColor,
                  child: const DividerWidget(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
