import 'package:flutter/material.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'package:flutter_boxing_timer/pages/home/home.viewmodels.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

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
            // Nombre
            Text('Name', style: Theme.of(context).textTheme.headlineLarge),
            Text(
              userViewModel.user.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            // Edad
            Text('Age', style: Theme.of(context).textTheme.headlineLarge),
            Text(
              '${userViewModel.user.age}',
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
          userViewModel.updateUser('Alice', 30);
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
