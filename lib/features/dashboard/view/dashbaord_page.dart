import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/chat/chat.dart';

import 'upper_section.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> _tabs = [
    const Center(child: Text('Info')),
    ChatView(),
    const Center(child: Text('Bet')),
    const Center(child: Text('Line-Up')),
  ];

  int selectedTab = 0;

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

        const SizedBox(height: 24),
        // Tab Bar Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabItem(
                isActive: selectedTab == 0,
                label: 'Info',
                onTap: () {
                  setState(() {
                    selectedTab = 0;
                  });
                },
              ),
              TabItem(
                isActive: selectedTab == 1,
                label: 'Chat',
                onTap: () {
                  setState(() {
                    selectedTab = 1;
                  });
                },
              ),
              TabItem(
                isActive: selectedTab == 2,
                label: 'Place a Bet',
                onTap: () {
                  setState(() {
                    selectedTab = 2;
                  });
                },
              ),
              TabItem(
                isActive: selectedTab == 3,
                label: 'Line-Up',
                onTap: () {
                  setState(() {
                    selectedTab = 3;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        DottedLine(
          dashColor: Colors.grey[300]!,
        ),
        Expanded(child: _tabs[selectedTab]),
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.isActive,
    required this.label,
    required this.onTap,
  });

  final bool isActive;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: gradient,
              )
            : null,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}