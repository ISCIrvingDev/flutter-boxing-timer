import 'package:flutter/material.dart';

class CurrentRoundWidget extends StatelessWidget {
  final int currentRound;

  const CurrentRoundWidget({super.key, required this.currentRound});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Round $currentRound',
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Color(0XFFfefcfb),
      ),
    );
  }
}
