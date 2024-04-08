import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/screens/platforms_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(1, 205, 232, 223),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PlatformsScreen(),
    );
  }
}