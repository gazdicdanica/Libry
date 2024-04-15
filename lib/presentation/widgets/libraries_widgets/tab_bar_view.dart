import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/models/platform.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_list.dart';

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key, required this.platform});
  final Platform platform;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        Center(
          child: LibrariesList(platform: platform, sort: "rank"),
        ),
        Center(
          child: LibrariesList(
              platform: platform, sort: "latest_release_published_at"),
        ),
      ],
    );
  }
}
