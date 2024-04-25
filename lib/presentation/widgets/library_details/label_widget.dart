import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/divider_widget.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
    required this.label,
    this.isLastInRow = false,
  });

  final String label;
  final bool isLastInRow;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              '$label ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (!isLastInRow) const DividerWidget(),
          ],
        ),
      ),
    );
  }
}
