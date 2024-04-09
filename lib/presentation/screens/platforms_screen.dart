import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/platforms/platforms_list.dart';

class PlatformsScreen extends StatelessWidget {
  const PlatformsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Platforms',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
        ),
      ),
      body: const PlatformsList(),
    );
  }
}
