import 'package:flutter/material.dart';

// * Theme
import 'package:flutter_boxing_timer/shared/theming/dark_theme.dart';
// import 'package:flutter_boxing_timer/shared/theming/theme.dart';

// * Pages
import 'package:flutter_boxing_timer/pages/home/home.page.dart';
import 'package:flutter_boxing_timer/pages/timer/timer.page.dart';

// * Services
// import 'package:flutter_boxing_timer/shared/services/auth/auth.repository.dart';
// import 'package:flutter_boxing_timer/shared/services/auth/auth.service.dart';
import 'package:flutter_boxing_timer/shared/services/timer/timer.repository.dart';
import 'package:flutter_boxing_timer/shared/services/timer/timer.service.dart';

// * Utils
import 'package:flutter_boxing_timer/shared/utils/duration_formats.util.dart';

// * MVVM
import 'package:provider/provider.dart';
// import 'package:flutter_boxing_timer/pages/example/example.viewmodels.dart'; // Ejemplo de modulo basico
import 'package:flutter_boxing_timer/pages/home/tabs/current_timer/current_timer.viewmodels.dart';
import 'package:flutter_boxing_timer/pages/timer/view_models/round_timer.viewmodel.dart';
import 'package:flutter_boxing_timer/pages/timer/view_models/round_notice_timer.viewmodel.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        // * Servicios
        // Provider<IAppAuthRepository>(create: (_) => AppAuthService()),
        Provider<IAppTimerRepository>(create: (_) => AppTimerService()),

        // * Utils
        Provider<DurationFormatsUtil>(create: (_) => DurationFormatsUtil()),

        // * ViewModels
        // ChangeNotifierProvider(create: (_) => ExampleViewModel()), // Ejemplo de modulo basico
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => RoundTimerViewModel()),
        ChangeNotifierProvider(create: (_) => RoundNoticeTimer()),
        // ChangeNotifierProvider(create: (_) => TimerViewModel2()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final title = 'Boxing Timer';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boxing Timer',

      // * Theme
      // theme: appTheme,
      theme: appDarkTheme,

      // * Named Routes
      initialRoute: '/',
      routes: {
        '/':
            (context) =>
                DefaultTabController(length: 3, child: HomePage(title: title)),
        '/timer': (context) => TimerPage(title: title),
      },
      // home: DefaultTabController(
      //   length: 3,
      //   child: const HomePage(title: 'Boxing Timer'),
      // ),
    );
  }
}
