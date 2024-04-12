import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/tab_bar.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/tab_bar_view.dart';

class LibrariesScreen extends StatelessWidget {
  final platform;

  const LibrariesScreen({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              platform.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          centerTitle: false,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: TabBarWidget(),
          ),
        ),
        body: TabBarViewWidget(
          platform: platform,
        ),
      ),
    );
  }
}
