import 'package:flutter/material.dart';
import 'package:flutter_boxing_timer/pages/home/home.page.dart';
import 'package:flutter_boxing_timer/shared/theming/dark_theme.dart';
// import 'package:flutter_boxing_timer/shared/theming/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: appTheme,
      theme: appDarkTheme,
      home: const HomePage(title: 'Current Set'),
    );
  }
}
