import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/divider_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/label_widget.dart';

class LibraryInfo extends StatelessWidget {
  const LibraryInfo({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            LabelWidget(label: label),
            LabelWidget(label: value),
          ],
        ),
        const Row(
          children: [
            DividerWidget(),
            DividerWidget(),
          ],
        ),
      ],
    );
  }
}
