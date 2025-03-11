import 'package:flutter/material.dart';

// * Widgets
import 'widgets/current_round.widget.dart';
import 'widgets/current_time.widget.dart';
import 'widgets/remaining_time.widget.dart';
import 'widgets/stop_pause.widget.dart';
import 'widgets/total_rounds.widget.dart';

class TimerPage extends StatelessWidget {
  final String title;

  const TimerPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(title),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              // Titulo
              CurrentRoundWidget(currentRound: 1),
              SizedBox(height: 20),

              // # de rounds
              TotalRoundsWidget(
                totalRounds: 3,
                roundMinutes: '03:00',
                breakMinutes: '01:00',
              ),
              SizedBox(height: 40),

              // Tiempo actual
              CurrentTimeWidget(currentTime: '02:56'),
              SizedBox(height: 40),

              // Botones
              StopPauseWidget(),
              SizedBox(height: 40),

              // Tiempo restante
              RemainingTimeWidget(
                elapsedTime: '00:19',
                pendingTime: '11:01',
                totalTime: '11:20',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
