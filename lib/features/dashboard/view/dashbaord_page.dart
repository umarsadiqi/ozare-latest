import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:ozare/features/chat/chat.dart';
import 'package:ozare/features/dashboard/view/bet_view.dart';
import 'package:ozare/features/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> _tabs = [
    const Center(child: Text('Info')),
    const ChatView(),
    const BetView(),
    const Center(child: Text('Line-Up')),
  ];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
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
                    context.read<HomeCubit>().disableHide();
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                ),
                TabItem(
                  isActive: selectedTab == 1,
                  label: 'Chat',
                  onTap: () {
                    context.read<HomeCubit>().enableHide();

                    setState(() {
                      selectedTab = 1;
                    });
                  },
                ),
                TabItem(
                  isActive: selectedTab == 2,
                  label: 'Place a Bet',
                  onTap: () {
                    context.read<HomeCubit>().disableHide();

                    setState(() {
                      selectedTab = 2;
                    });
                  },
                ),
                TabItem(
                  isActive: selectedTab == 3,
                  label: 'Line-Up',
                  onTap: () {
                    context.read<HomeCubit>().disableHide();

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
      ),
    );
  }
}
