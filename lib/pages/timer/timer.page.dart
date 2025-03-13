import 'package:flutter/material.dart';

// * DTOs
import 'package:flutter_boxing_timer/shared/services/timer/dtos/current_timer.dto.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'timer.viewmodels.dart';

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
    final arguments =
        (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
            as Map;
    CurrentTimerDto timerDto = arguments['timerDto'];
    print(timerDto);

    final timerViewModel = Provider.of<TimerViewModel>(context);

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
              // Text('ID: $idTimer'),
              // Titulo
              CurrentRoundWidget(
                currentRound: timerViewModel.timerModel.currentRound,
              ),
              SizedBox(height: 20),

              // # de rounds
              TotalRoundsWidget(
                totalRounds: timerDto.totalRounds,
                roundMinutes: timerDto.roundTime,
                breakMinutes: timerDto.breakTime,
              ),
              SizedBox(height: 40),

              // Tiempo actual
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    // color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                child: CurrentTimeWidget(
                  currentTime: timerViewModel.timerModel.currentTime,
                ),
              ),
              SizedBox(height: 40),

              // Botones
              StopPauseWidget(),
              SizedBox(height: 40),

              // Tiempo restante
              RemainingTimeWidget(
                elapsedTime: timerViewModel.timerModel.elapsedTime,
                pendingTime: timerViewModel.timerModel.pendingTime,
                totalTime: timerViewModel.timerModel.totalTime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
