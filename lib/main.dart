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
      title: 'Package Manager App',
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 205, 232, 223),
          ),
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 72, 75, 73)),
          )
          ),
      home: const PlatformsScreen(),
    );
  }
}
