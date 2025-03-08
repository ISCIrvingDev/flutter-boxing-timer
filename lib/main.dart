import 'package:flutter/material.dart';

// * Theme
import 'package:flutter_boxing_timer/shared/theming/dark_theme.dart';
// import 'package:flutter_boxing_timer/shared/theming/theme.dart';

// * Pages
import 'package:flutter_boxing_timer/pages/home/home.page.dart';

// * Services
import 'package:flutter_boxing_timer/shared/services/auth/auth.repository.dart';
import 'package:flutter_boxing_timer/shared/services/auth/auth.service.dart';

// * MVVM
import 'package:provider/provider.dart';
// import 'package:flutter_boxing_timer/pages/example/example.viewmodels.dart'; // Ejemplo de modulo basico
import 'package:flutter_boxing_timer/pages/home/home.viewmodels.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        // Servicios
        Provider<IAppAuthRepository>(create: (_) => AppAuthService()),

        // ViewModels
        // ChangeNotifierProvider(create: (_) => ExampleViewModel()), // Ejemplo de modulo basico
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boxing Timer',
      // theme: appTheme,
      theme: appDarkTheme,
      home: const HomePage(title: 'Current Set'),
    );
  }
}
