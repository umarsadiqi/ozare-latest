import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/common/widgets/oval_clipper.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/dashboard/widgets/event_tile.dart';
import 'package:ozare/features/home/home.dart';
import 'package:ozare/models/models.dart';

import '../widgets/widgets.dart';

class EventView extends StatefulWidget {
  const EventView({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  State<EventView> createState() => _MatchViewState();
}

class _MatchViewState extends State<EventView> {
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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.265,
            width: size.width,
            child: Stack(children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  height: size.height * 0.22,
                  width: size.width,
                  child: ClipPath(
                    clipper: OvalBottomClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: gradient,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/pattern.png',
                  color: Colors.white.withOpacity(0.11),
                  width: size.width,
                  height: size.height * 0.3,
                ),
              ),
              Positioned(
                  top: 46,
                  right: 24,
                  left: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white30,
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      const Text(
                        'Match',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white30,
                        child: Icon(Icons.more_vert, color: Colors.white),
                      ),
                    ],
                  )),

              // Match List Section
              // height: size.height * 0.15,
              Positioned(
                top: size.height * 0.11,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * 0.15,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: EventTile(
                    event: widget.event,
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 12),
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
