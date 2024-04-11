import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/libraries_widgets/libraries_list.dart';

class LibrariesScreen extends StatelessWidget{
  final platform;

  const LibrariesScreen({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(platform.name,
          style:Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        centerTitle: false,
      ),
      body:   LibrariesList(platform: platform,),
    );
  }

}