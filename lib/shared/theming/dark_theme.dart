import 'package:flutter/material.dart';

final ThemeData appDarkTheme = ThemeData.dark().copyWith(
  // Paleta de colores
  primaryColor: Color(0XFF282c2f), // Color principal de la app
  scaffoldBackgroundColor: Color(0XFF282c2f), // Fondo de la app
  colorScheme: ColorScheme.dark().copyWith(
    primary: Color(0XFFc73d35),
    secondary: Color(0XFF6d7170),
    // tertiary: Colors.grey,
    // surface: Colors.purple,
    // error: Colors.red,
  ),

  // Textos
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0XFFfefcfb),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0XFFfefcfb)),

    // Texto de botones
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0XFFfefcfb),
    ),
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Color(0XFF1de1b8), // Color inicial
    stopIndicatorColor: Color(0XFFfc2e36), // Color al detenerse
    circularTrackColor: Color(0XFFffd657), // Color en progreso
  ),

  // Botones
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: Color(0XFF), // Color del botón
  //     foregroundColor: Color(0XFF), // Color del texto del botón
  //     textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //   ),
  // ),
);
