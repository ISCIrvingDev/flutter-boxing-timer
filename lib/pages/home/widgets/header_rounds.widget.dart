import 'package:flutter/material.dart';

class HeaderRoundsWidget extends StatelessWidget {
  final String header;

  const HeaderRoundsWidget({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Text(header, style: Theme.of(context).textTheme.headlineLarge);
  }
}
