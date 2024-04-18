import 'package:flutter/material.dart';

const textColor = Color.fromARGB(255, 72, 75, 73);
const themeSeedColor = Color.fromARGB(255, 205, 232, 223);
const darkGreenColor = Color.fromRGBO(0, 166, 141, 1);
const darkGreyColor = Color.fromRGBO(72, 75, 73, 1);
const lightGreyColor = Color.fromRGBO(233, 239, 236, 1);
const redColor = Color.fromRGBO(186, 26, 26, 1);
const bottomNavigationColor = Color.fromARGB(255, 233, 239, 236);

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
      ),
);
