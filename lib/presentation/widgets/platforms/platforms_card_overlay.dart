import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/platform.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlatformsCardOverlay extends StatelessWidget {
  const PlatformsCardOverlay({super.key, required this.platform});

  final Platform platform;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            platform.name,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                MdiIcons.packageVariantClosed,
                color: textColor,
              ),
              const SizedBox(width: 5),
              Text(
                platform.projectCount.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 20),
              platform.defaultLanguage != null
                  ? Row(children: [
                      Icon(
                        MdiIcons.codeTags,
                        color: textColor,
                      ),
                      const SizedBox(width: 5),
                      Text(platform.defaultLanguage!)
                    ])
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
