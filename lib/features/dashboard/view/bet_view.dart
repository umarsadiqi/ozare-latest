import 'package:flutter/material.dart';
import 'package:ozare/features/chat/chat.dart';
import 'package:ozare/features/dashboard/widgets/bet_tile.dart';

class BetView extends StatelessWidget {
  const BetView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.55,
      child: Column(
        children: [
          const BetHeader(),
          const Divider(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(onTap: () {}, child: const BetTile());
              },
            ),
          ),
        ],
      ),
    );
  }
}
