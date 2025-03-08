import 'package:flutter/material.dart';

// * Tabs
import 'current_timer/current_timer.tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(widget.title),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Presets'),
            Tab(icon: Icon(Icons.chat_rounded), text: 'Chart'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          children: [
            CurrentTimerTab(),
            Container(
              color: Colors.redAccent,
              child: const Icon(Icons.chat_rounded),
            ),
            Container(
              color: Colors.orangeAccent,
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
