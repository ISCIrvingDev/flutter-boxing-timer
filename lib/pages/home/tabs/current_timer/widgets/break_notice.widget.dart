import 'package:flutter/material.dart';

class BreakNoticeWidget extends StatelessWidget {
  final String breakTime;
  final String breakNoticeTime;

  const BreakNoticeWidget({
    super.key,
    required this.breakTime,
    required this.breakNoticeTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            children: [
              Text('Break', style: Theme.of(context).textTheme.bodyLarge),
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
                  Text(breakTime, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ],
          ),
        ),
        Expanded(
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
                  Text(
                    breakNoticeTime,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
