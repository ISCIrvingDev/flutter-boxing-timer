import 'package:flutter/material.dart';

class RoundNoticeWidget extends StatelessWidget {
  const RoundNoticeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          // flex: 4,
          child: Column(
            children: [
              Text('Round', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: 100,
                    // No es necesario indicar el estilo, ya lo jala de manera automatica
                    // color: Theme.of(context).progressIndicatorTheme.color,
                  ),
                  SizedBox(width: 10),
                  Text('03:00', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          // flex: 4,
          child: Column(
            children: [
              Text('Notice', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: 100,
                    // No es necesario indicar el estilo, ya lo jala de manera automatica
                    color:
                        Theme.of(
                          context,
                        ).progressIndicatorTheme.circularTrackColor,
                  ),
                  SizedBox(width: 10),
                  Text('15s', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
