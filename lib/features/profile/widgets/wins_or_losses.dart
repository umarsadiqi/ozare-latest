import 'package:flutter/material.dart';

import 'stat_box.dart';

class WinOrLosses extends StatelessWidget {
  const WinOrLosses({
    super.key,
    required this.wins,
    required this.losses,
  });

  final int wins;
  final int losses;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatBox(
          label: 'Wins',
          value: wins,
        ),
        const SizedBox(width: 16),
        StatBox(
          label: 'Losses',
          value: losses,
        ),
      ],
    );
  }
}
