import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ozare/models/bet.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.bet,
  });

  final Bet bet;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.245,
              child: AutoSizeText(
                bet.team1,
                maxFontSize: 12,
                minFontSize: 8,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.network(bet.logo1),
            ),
            const SizedBox(width: 8),
            const Text(
              "VS",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.network(bet.logo2),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: size.width * 0.245,
              child: AutoSizeText(
                bet.team2,
                maxFontSize: 12,
                minFontSize: 8,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              height: 32,
              width: 52,
              decoration: BoxDecoration(
                color: getColor(bet.won).withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: Text(
                  getStatus(bet.won),
                  style: TextStyle(
                    color: getColor(bet.won),
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Color getColor(int status) {
    switch (status) {
      case -1:
        return Colors.grey;
      case 0:
        return const Color(0xFF00BA88);
      case 1:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getStatus(int status) {
    switch (status) {
      case -1:
        return 'Pending';
      case 0:
        return 'Won';
      case 1:
        return 'Lost';
      default:
        return 'Pending';
    }
  }
}
