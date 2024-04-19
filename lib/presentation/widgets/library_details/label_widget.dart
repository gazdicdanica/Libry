import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          overflow: TextOverflow.ellipsis,
          '$label ',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
