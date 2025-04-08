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
import 'package:flutter_boxing_timer/pages/timer/view_models/round_notice_timer.viewmodel.dart';

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
  // late DurationFormatsUtil durationFormatsUtil;
  late CurrentTimerDto timerDto;
  // late RoundTimerViewModel roundTimerViewModel =
  //     Provider.of<RoundTimerViewModel>(context);
  // late RoundNoticeTimerViewModel roundNoticeTimer =
  //     Provider.of<RoundNoticeTimerViewModel>(context);

  int roundTimerViewModelCounter = 0;

  @override
  void initState() {
    Future.microtask(() async {
      arguments =
          // ignore: use_build_context_synchronously
          (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
              as Map;

      timerDto = arguments['timerDto'];

      // Round Notice Timer
      int roundNoticeTimerLocalSeconds =
          int.tryParse(timerDto.roundNoticeTime.substring(0, 2)) ?? 0;

      var roundNoticeTimerModel = TimerModel(
        seconds: roundNoticeTimerLocalSeconds,
        minutes: 0,
        digitSeconds: roundNoticeTimerLocalSeconds.toString().padLeft(2, '0'),
        digitMinutes: '00',
      );

      // Round Timer
      int localSeconds = int.tryParse(timerDto.roundTime.substring(3, 5)) ?? 0;
      int localMinutes = int.tryParse(timerDto.roundTime.substring(0, 2)) ?? 0;

      TimerModel roundTimerModel = TimerModel(
        seconds: localSeconds,
        minutes: localMinutes,
        digitSeconds: localSeconds.toString().padLeft(2, '0'),
        digitMinutes: localMinutes.toString().padLeft(2, '0'),
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Round Notice Timer
        RoundNoticeTimerViewModel roundNoticeTimer =
            Provider.of<RoundNoticeTimerViewModel>(context, listen: false);

        roundNoticeTimer.setTimerModel(roundNoticeTimerModel);
        roundNoticeTimer.start();

        // Round Timer
        Provider.of<RoundTimerViewModel>(
          context,
          listen: false,
        ).setTimerModel(roundTimerModel);
      });
      // roundTimerViewModel.start();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Se usa "watch()" para que la UI se reconstruya al notificar cambios ya que el "Provider.of<RoundNoticeTimerViewModel>" esta con "listen: false"
    final roundNoticeTimerViewModel =
        context.watch<RoundNoticeTimerViewModel>();
    final roundTimerViewModel = context.watch<RoundTimerViewModel>();

    // ITimerRepository timerViewModel =
    //     roundNoticeTimerViewModel.isCompleted
    //         ? () => {
    //           roundTimerViewModelCounter++;

    //           return roundTimerViewModel;
    //         }()
    //         : roundNoticeTimerViewModel;

    ITimerRepository timerViewModel;

    if (roundNoticeTimerViewModel.isCompleted) {
      roundTimerViewModelCounter++;

      timerViewModel = roundTimerViewModel;

      if (roundTimerViewModelCounter == 1) timerViewModel.start();
    } else {
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
                // currentRound: timerViewModel.timerModel.currentRound,
                currentRound: 6,
              ),
              SizedBox(height: 20),

              // # de rounds
              TotalRoundsWidget(
                // totalRounds: timerViewModel.timerModel.totalRounds,
                // roundMinutes: timerViewModel.timerModel.roundTime,
                // breakMinutes: timerViewModel.timerModel.breakTime,
                totalRounds: 12, // timerDto.totalRounds,
                roundMinutes: '04:00', //timerDto.roundTime,
                breakMinutes: '00:50', //timerDto.breakTime,
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
