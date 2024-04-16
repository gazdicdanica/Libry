import 'package:flutter/material.dart';

const textColor = Color.fromARGB(255, 72, 75, 73);
const themeSeedColor = Color.fromARGB(255, 205, 232, 223);

final theme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: themeSeedColor,
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        headlineSmall: const TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        labelLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        bodyMedium: const TextStyle(
          fontSize: 15,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: const TextStyle(
          fontSize: 35,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        displayLarge: const TextStyle(
            fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
      ),
);
