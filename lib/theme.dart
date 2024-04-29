import 'package:flutter/material.dart';

const textColor = Color.fromARGB(255, 72, 75, 73);
const themeSeedColor = Color.fromARGB(255, 205, 232, 223);
const darkGreenColor = Color.fromRGBO(0, 166, 141, 1);
const lightGreenColor = Color.fromRGBO(205, 232, 223, 1);
const darkAppBarColor = Color.fromRGBO(0, 81, 68, 1);
const darkGreyColor = Color.fromRGBO(72, 75, 73, 1);
const lightGreyColor = Color.fromRGBO(233, 239, 236, 1);
const redColor = Color.fromRGBO(186, 26, 26, 1);
const bottomNavigationColor = Color.fromARGB(255, 233, 239, 236);

final theme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
      seedColor: themeSeedColor,
      secondaryContainer: lightGreenColor,
      onPrimary: textColor,
      onBackground: textColor,
      background: lightGreyColor,
      brightness: Brightness.light),
  tabBarTheme: const TabBarTheme().copyWith(
    indicator: const BoxDecoration(
      color: themeSeedColor,
    ),
    labelColor: darkGreyColor,
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
  navigationBarTheme: const NavigationBarThemeData(
    elevation: 5,
    backgroundColor: bottomNavigationColor,
    surfaceTintColor: bottomNavigationColor,
    indicatorColor: themeSeedColor,
    iconTheme: MaterialStatePropertyAll(IconThemeData(color: textColor)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(textColor),
      backgroundColor: MaterialStateProperty.all<Color>(themeSeedColor),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
      elevation: MaterialStateProperty.all(5),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: themeSeedColor,
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    secondaryContainer: darkGreenColor,
    seedColor: darkGreenColor,
    onPrimary: lightGreyColor,
    background: darkGreyColor,
    onBackground: lightGreyColor,
    brightness: Brightness.dark,
  ),
  tabBarTheme: const TabBarTheme().copyWith(
    indicator: const BoxDecoration(
      color: darkGreenColor,
    ),
    labelColor: lightGreyColor,
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
        headlineSmall: const TextStyle(
          fontWeight: FontWeight.bold,
          color: lightGreyColor,
        ),
        labelLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: lightGreyColor,
        ),
        bodyMedium: const TextStyle(
          fontSize: 15,
          color: lightGreyColor,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: const TextStyle(
          fontSize: 35,
          color: lightGreyColor,
          fontWeight: FontWeight.bold,
        ),
      ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(lightGreyColor),
      backgroundColor: MaterialStateProperty.all<Color>(darkGreenColor),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
      elevation: MaterialStateProperty.all(5),
    ),
  ),
);