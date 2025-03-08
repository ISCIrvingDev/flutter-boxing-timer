import 'package:flutter/material.dart';

// * Services
import 'package:flutter_boxing_timer/shared/services/auth/auth.repository.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'package:flutter_boxing_timer/pages/home/home.viewmodels.dart';

// * Widgets
import 'widgets/break_notice.widget.dart';
import 'widgets/header_rounds.widget.dart';
import 'widgets/round_notice.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // * Services
    final authService = context.read<IAppAuthRepository>();

    // * View Models
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // color: Colors.red,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              // Titulo
              HeaderRoundsWidget(header: '3 Rounds'),
              SizedBox(height: 20),

              // Tiempos
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    // color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                child: Column(
                  children: [
                    RoundNoticeWidget(),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    BreakNoticeWidget(),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Boton para empezar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  label: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
