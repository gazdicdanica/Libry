import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/platform.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlatformsCardOverlay extends StatelessWidget {
  const PlatformsCardOverlay({super.key, required this.platform});

  final Platform platform;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          platform.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Icon(MdiIcons.package)],
        ),
      ],
    );
  }
}
