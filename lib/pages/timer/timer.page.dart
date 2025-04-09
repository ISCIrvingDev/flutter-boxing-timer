import 'package:flutter/material.dart';

// * DTOs
import 'package:flutter_boxing_timer/shared/services/timer/dtos/current_timer.dto.dart';

// * Utils
// import 'package:flutter_boxing_timer/shared/utils/duration_formats.util.dart';

// * Repositories
import 'view_models/timer.repository.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'timer.models.dart';
import 'view_models/round_timer.viewmodel.dart';
import 'view_models/round_notice_timer.viewmodel.dart';
import 'view_models/break_timer.viewmodel.dart';

// * Widgets
import 'widgets/current_round.widget.dart';
import 'widgets/current_time.widget.dart';
import 'widgets/remaining_time.widget.dart';
import 'widgets/stop_pause.widget.dart';
import 'widgets/total_rounds.widget.dart';

class TimerPage extends StatefulWidget {
  final String title;

  const TimerPage({super.key, required this.title});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int roundTimerViewModelCounter = 0, breakTimerViewModelCounter = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map arguments =
          (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
              as Map;

      CurrentTimerDto timerDto = arguments['timerDto'];

      // Round Notice Timer
      int roundNoticeTimerSeconds =
          int.tryParse(timerDto.roundNoticeTime.substring(0, 2)) ?? 0;

      var roundNoticeTimerModel = TimerModel(
        seconds: roundNoticeTimerSeconds,
        minutes: 0,
        digitSeconds: roundNoticeTimerSeconds.toString().padLeft(2, '0'),
        digitMinutes: '00',
        currentRound: 1,
        digitCurrentRound: '01',
      );

      RoundNoticeTimerViewModel roundNoticeTimer =
          Provider.of<RoundNoticeTimerViewModel>(context, listen: false);

      roundNoticeTimer.setTimerModel(roundNoticeTimerModel);
      roundNoticeTimer.start();

      // Round Timer
      int roundTimerSeconds =
          int.tryParse(timerDto.roundTime.substring(3, 5)) ?? 0;
      int roundTimerMinutes =
          int.tryParse(timerDto.roundTime.substring(0, 2)) ?? 0;

      TimerModel roundTimerModel = TimerModel(
        seconds: roundTimerSeconds,
        minutes: roundTimerMinutes,
        digitSeconds: roundTimerSeconds.toString().padLeft(2, '0'),
        digitMinutes: roundTimerMinutes.toString().padLeft(2, '0'),
        currentRound: 1,
        digitCurrentRound: '01',
      );

      Provider.of<RoundTimerViewModel>(
        context,
        listen: false,
      ).setTimerModel(roundTimerModel);

      // Break Timer
      int breakTimerSeconds =
          int.tryParse(timerDto.breakTime.substring(3, 5)) ?? 0;
      int breakTimerMinutes =
          int.tryParse(timerDto.breakTime.substring(0, 2)) ?? 0;

      TimerModel breakTimerModel = TimerModel(
        seconds: breakTimerSeconds,
        minutes: breakTimerMinutes,
        digitSeconds: breakTimerSeconds.toString().padLeft(2, '0'),
        digitMinutes: breakTimerMinutes.toString().padLeft(2, '0'),
        currentRound: 1,
        digitCurrentRound: '01',
      );

      Provider.of<BreakTimerViewModel>(
        context,
        listen: false,
      ).setTimerModel(breakTimerModel);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments =
        (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
            as Map;

    final CurrentTimerDto timerDto = arguments['timerDto'];

    // Se usa "watch()" para que la UI se reconstruya al notificar cambios ya que el "Provider.of<RoundNoticeTimerViewModel>" esta con "listen: false", lo mismo con "RoundTimerViewModel" y "BreakTimerViewModel"
    final roundNoticeTimerViewModel =
        context.watch<RoundNoticeTimerViewModel>();
    final roundTimerViewModel = context.watch<RoundTimerViewModel>();
    final breakTimerViewModel = context.watch<BreakTimerViewModel>();

    ITimerRepository timerViewModel;

    /*
    * Resetear los valores de "roundNoticeTimerViewModel", "roundTimerViewModel" y de "breakTimerViewModel" para que vuelva a empezar el ciclo hasta que timerViewModel.timerModel.currentRound == timerDto.totalRounds
    */

    if (roundNoticeTimerViewModel.isCompleted &&
        !roundTimerViewModel.isCompleted) {
      // Este repite las mismas veces que el numero de rounds
      roundTimerViewModelCounter++;

      timerViewModel = roundTimerViewModel;

      if (roundTimerViewModelCounter == 1) timerViewModel.start();
    } else if (roundTimerViewModel.isCompleted) {
      // Este repite las mismas veces que el numero de rounds - 1
      breakTimerViewModelCounter++;

      timerViewModel = breakTimerViewModel;

      if (breakTimerViewModelCounter == 1) {
        timerViewModel.start();
      }

      if (timerViewModel.timerModel.minutes == 0 &&
          timerViewModel.timerModel.seconds == 0 &&
          timerViewModel.timerModel.currentRound <= timerDto.totalRounds) {
        roundTimerViewModelCounter = 1;
        breakTimerViewModelCounter = 0;
        roundTimerViewModel.isCompleted = false;

        // Resetear valores de los Timers - Inicio
        // Round Timer
        int roundTimerSeconds =
            int.tryParse(timerDto.roundTime.substring(3, 5)) ?? 0;
        int roundTimerMinutes =
            int.tryParse(timerDto.roundTime.substring(0, 2)) ?? 0;

        TimerModel roundTimerModel = TimerModel(
          seconds: roundTimerSeconds,
          minutes: roundTimerMinutes,
          digitSeconds: roundTimerSeconds.toString().padLeft(2, '0'),
          digitMinutes: roundTimerMinutes.toString().padLeft(2, '0'),
          currentRound: timerViewModel.timerModel.currentRound,
          digitCurrentRound: '01',
        );

        roundTimerViewModel.setTimerModel(roundTimerModel);

        if (timerViewModel.timerModel.currentRound != timerDto.totalRounds) {
          // Break Timer
          int breakTimerSeconds =
              int.tryParse(timerDto.breakTime.substring(3, 5)) ?? 0;
          int breakTimerMinutes =
              int.tryParse(timerDto.breakTime.substring(0, 2)) ?? 0;

          TimerModel breakTimerModel = TimerModel(
            seconds: breakTimerSeconds,
            minutes: breakTimerMinutes,
            digitSeconds: breakTimerSeconds.toString().padLeft(2, '0'),
            digitMinutes: breakTimerMinutes.toString().padLeft(2, '0'),
            currentRound: timerViewModel.timerModel.currentRound,
            digitCurrentRound: '01',
          );

          breakTimerViewModel.setTimerModel(breakTimerModel);
        }
        // Resetear valores de los Timers - Fin

        timerViewModel = roundTimerViewModel;

        timerViewModel.start();
      }
    } else {
      // Este solamente se debe activar la primera vez
      timerViewModel = roundNoticeTimerViewModel;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
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
                  // currentTime: timerViewModel.timerModel.currentTime,
                  currentTime:
                      roundNoticeTimerViewModel.isCompleted
                          ? '${timerViewModel.timerModel.digitMinutes}:${timerViewModel.timerModel.digitSeconds}'
                          : '${timerViewModel.timerModel.digitSeconds}s',
                ),
              ),
              SizedBox(height: 40),

              // Botones
              StopPauseWidget(timerViewModel: timerViewModel),
              SizedBox(height: 40),

              // Tiempo restante
              RemainingTimeWidget(
                // elapsedTime: timerViewModel.timerModel.elapsedTime,
                // pendingTime: timerViewModel.timerModel.pendingTime,
                elapsedTime: '111',
                pendingTime: '222',
                // totalTime: timerViewModel.timerModel.totalTime,
                totalTime: '12:00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
