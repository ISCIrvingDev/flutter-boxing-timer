import 'package:flutter/material.dart';

// * Repository
import 'package:flutter_boxing_timer/pages/timer/view_models/timer.repository.dart';

class StopPauseWidget extends StatelessWidget {
  ITimerRepository timerViewModel;

  StopPauseWidget({super.key, required this.timerViewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          label: Text(
            timerViewModel.started ? 'Pause' : 'Resume',
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          icon: Icon(
            Icons.pause,
            color: Theme.of(context).colorScheme.tertiary,
            size: 22,
          ),
          onPressed: () {
            if (timerViewModel.started) {
              timerViewModel.stop();
            } else {
              timerViewModel.start();
            }
          },
        ),

        ElevatedButton.icon(
          label: Text('Stop', style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          icon: Icon(
            Icons.stop,
            color: Theme.of(context).colorScheme.tertiary,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
