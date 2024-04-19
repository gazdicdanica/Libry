import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class KeywordsDetails extends StatelessWidget {
  final List<String>? keywords;
  const KeywordsDetails({super.key, required this.keywords});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.keywords,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: keywords?.map((keyword) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: lightGreenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      keyword,
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                }).toList() ??
                [],
          ),
        ],
      ),
    );
  }
}
