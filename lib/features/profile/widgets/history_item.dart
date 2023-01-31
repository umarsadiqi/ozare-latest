import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.25,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'St. Germain',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/logo1.png'),
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
              child: Image.asset('assets/images/logo2.png'),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: size.width * 0.25,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Man Utd',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              height: 32,
              width: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF00BA88).withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Center(
                child: Text(
                  'Win',
                  style: TextStyle(
                    color: Color(0xFF00BA88),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
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
}
