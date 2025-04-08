import 'package:flutter/material.dart';

// * Services
// import 'package:flutter_boxing_timer/shared/services/auth/auth.repository.dart';
import 'package:flutter_boxing_timer/shared/services/timer/timer.repository.dart';
import 'package:flutter_boxing_timer/shared/services/timer/timer.service.dart';

// * DTOs
import 'package:flutter_boxing_timer/shared/services/timer/dtos/current_timer.dto.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'current_timer.viewmodels.dart';

// * Widgets
import 'widgets/break_notice.widget.dart';
import 'widgets/header_rounds.widget.dart';
import 'widgets/round_notice.widget.dart';

class CurrentTimerTab extends StatefulWidget {
  const CurrentTimerTab({super.key});

  @override
  State<CurrentTimerTab> createState() => _CurrentTimerTabState();
}

class _CurrentTimerTabState extends State<CurrentTimerTab> {
  CurrentTimerDto timerDto = defaultCurrentTimerDto;

  Future<void> onInit() async {
    timerDto = await AppTimerService().getCurrentTimer();
  }

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onInit();

      // setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // * Services
    // final authService = context.read<IAppAuthRepository>();
    final timerService = context.read<IAppTimerRepository>();

    // * View Models
    final userViewModel = Provider.of<UserViewModel>(context);

    return Container(
      width: double.infinity,
      // color: Colors.red,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          // Titulo
          HeaderRoundsWidget(header: '${timerDto.totalRounds} Rounds'),
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
                RoundNoticeWidget(
                  roundTime: timerDto.roundTime,
                  roundNoticeTime: timerDto.roundNoticeTime,
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                BreakNoticeWidget(
                  breakTime: timerDto.breakTime,
                  breakNoticeTime: timerDto.breakNoticeTime,
                ),
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
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/timer',
                  arguments: {'timerDto': timerDto},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
