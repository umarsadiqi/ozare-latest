import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';

import 'upper_section.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.36,
          width: size.width,
          child: const UpperSection(),
        ),

        const SizedBox(height: 18),
        // Tab Bar Section
        DefaultTabController(
            length: 4,
            child: Column(children: [
              TabBar(
                splashBorderRadius: BorderRadius.circular(32),
                padding: const EdgeInsets.only(left: 12),
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.8,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: gradient,
                ),
                tabs: const [
                  Tab(text: 'Info'),
                  Tab(text: 'Chat'),
                  Tab(text: 'Place a Bet'),
                  Tab(text: 'Line-UP'),
                ],
              ),
            ])),
      ],
    );
  }
}
