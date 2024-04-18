import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class LicenseDetails extends StatelessWidget {
  final List<String>? licenses;
  const LicenseDetails({super.key, required this.licenses});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                t.licenses,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: licenses?.map((license) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        width: 65,
                        height: 35,
                        decoration: BoxDecoration(
                          color: lightGreenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          license,
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    }).toList() ??
                    [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
