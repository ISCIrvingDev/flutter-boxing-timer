import 'package:flutter/material.dart';

class StopPauseWidget extends StatelessWidget {
  const StopPauseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          label: Text('Pause', style: TextStyle(fontSize: 20)),
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
          onPressed: () {},
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
