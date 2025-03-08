import 'package:flutter/material.dart';

// * Services
import 'package:flutter_boxing_timer/shared/services/auth/auth.repository.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'package:flutter_boxing_timer/pages/example/example.viewmodels.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key, required this.title});
  final String title;

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    // * Services
    final authService = context.read<IAppAuthRepository>();

    // * View Models
    final exampleViewModel = Provider.of<ExampleViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Auth
            Text('Log In'),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {
                authService.isAuthenticated
                    ? authService.logout()
                    : authService.login();
              },
              child: Text('Auth'),
            ),
            SizedBox(height: 20),

            // Nombre
            Text('Name', style: Theme.of(context).textTheme.headlineLarge),
            Text(
              exampleViewModel.example.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            // Edad
            Text('Age', style: Theme.of(context).textTheme.headlineLarge),
            Text(
              '${exampleViewModel.example.age}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Change Value',
        shape: Theme.of(context).floatingActionButtonTheme.shape,
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        foregroundColor:
            Theme.of(context).floatingActionButtonTheme.foregroundColor,
        onPressed: () {
          exampleViewModel.updateExample('Alice', 30);
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
