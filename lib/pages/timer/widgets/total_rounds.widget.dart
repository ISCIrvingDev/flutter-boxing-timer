import 'package:flutter/material.dart';

class TotalRoundsWidget extends StatelessWidget {
  final int totalRounds;
  final String roundMinutes;
  final String breakMinutes;

  const TotalRoundsWidget({
    super.key,
    required this.totalRounds,
    required this.roundMinutes,
    required this.breakMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$totalRounds rounds - $roundMinutes / $breakMinutes',
      style: TextStyle(fontSize: 20, color: Color(0XFFfefcfb)),
    );
  }
}
