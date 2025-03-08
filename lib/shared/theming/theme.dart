import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.blue, // Color principal de la app
  scaffoldBackgroundColor: Colors.grey[200], // Fondo de la app

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),

    // Texto de botones
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Color del botón
      foregroundColor: Colors.white, // Color del texto del botón
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
);
