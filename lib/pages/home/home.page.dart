import 'package:flutter/material.dart';

// * Tabs
import 'tabs/current_timer/current_timer.tab.dart';
import 'package:flutter_boxing_timer/pages/home/timers/timers.tab.dart';

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
            Tab(icon: Icon(Icons.more_time_rounded), text: 'Timers'),
            Tab(icon: Icon(Icons.settings_outlined), text: 'Settings'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          children: [
            CurrentTimerTab(),
            TimersTab(),
            Container(
              color: Colors.orangeAccent,
              child: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
