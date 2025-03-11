import 'package:flutter/material.dart';

class RemainingTimeWidget extends StatelessWidget {
  final String elapsedTime;
  final String pendingTime;
  final String totalTime;

  const RemainingTimeWidget({
    super.key,
    required this.elapsedTime,
    required this.pendingTime,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$elapsedTime / $pendingTime / $totalTime',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
