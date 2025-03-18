import 'package:flutter/material.dart';

// * DTOs
import 'package:flutter_boxing_timer/shared/services/timer/dtos/current_timer.dto.dart';

// * Utils
import 'package:flutter_boxing_timer/shared/utils/duration_formats.util.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'timer.models.dart';
import 'timer.viewmodels.dart';

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
  late Map arguments;
  late DurationFormatsUtil durationFormatsUtil;
  late CurrentTimerDto timerDto;
  late TimerViewModel timerViewModel = Provider.of<TimerViewModel>(context);

  @override
  void initState() {
    Future.microtask(() async {
      arguments =
          // ignore: use_build_context_synchronously
          (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
              as Map;

      // ignore: use_build_context_synchronously
      durationFormatsUtil = context.read<DurationFormatsUtil>();

      timerDto = arguments['timerDto'];

      print(timerDto);

      var timerModel = TimerModel(
        currentRound: 1,
        totalRounds: timerDto.totalRounds,
        roundTime: timerDto.roundTime,
        breakTime: timerDto.breakTime,
        currentTime: durationFormatsUtil.formatSecondsStringTime(
          timerDto.roundNoticeTime,
        ),
        elapsedTime: '00:00',
        pendingTime: '11:01',
        totalTime: '11:20',
      );

      // ignore: use_build_context_synchronously
      timerViewModel = Provider.of<TimerViewModel>(context);

      // Provider.of<TimerViewModel>(
      //   // ignore: use_build_context_synchronously
      //   context,
      //   listen: false,
      // ).setTimerModel(timerModel);
      timerViewModel.setTimerModel(timerModel);

      // Timer
      var stopwatch = Stopwatch();

      stopwatch.start();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final arguments =
    //     (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
    //         as Map;
    // CurrentTimerDto timerDto = arguments['timerDto'];

    // final timerViewModel = Provider.of<TimerViewModel>(context);

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
                totalRounds: timerViewModel.timerModel.totalRounds,
                roundMinutes: timerViewModel.timerModel.roundTime,
                breakMinutes: timerViewModel.timerModel.breakTime,
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
