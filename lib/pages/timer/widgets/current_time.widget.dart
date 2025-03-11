import 'package:flutter/material.dart';

class CurrentTimeWidget extends StatelessWidget {
  final String currentTime;

  const CurrentTimeWidget({super.key, required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Text(
      currentTime,
      style: TextStyle(
        fontSize: 128,
        fontWeight: FontWeight.bold,
        color: Color(0XFFfefcfb),
      ),
    );
  }
}
