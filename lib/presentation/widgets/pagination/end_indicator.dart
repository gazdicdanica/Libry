import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class EndIndicator extends StatelessWidget {
  const EndIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        Icon(
          Icons.check_circle_outline,
          size: 40,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 10),
        Text(
          t.end_of_list,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
