import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozare/consts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ozare/features/dashboard/view/dashbaord_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = 0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          gradient: gradient,
          shape: BoxShape.circle,
        ),
        child: const Center(
            child: FaIcon(
          FontAwesomeIcons.trophy,
          color: Colors.white,
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 68,
          width: size.width,
          child: Row(children: [
            BottomNavItem(
              label: 'Home',
              iconPath: 'assets/icons/home_s.svg',
              isActive: selectedTab == 0,
            ),
            BottomNavItem(
              label: 'Payments',
              iconPath: 'assets/icons/wallet.svg',
              isActive: selectedTab == 1,
            ),
            const Spacer(),
            BottomNavItem(
              label: 'Notifications',
              iconPath: 'assets/icons/bell.svg',
              isActive: selectedTab == 2,
            ),
            BottomNavItem(
              label: 'Profile',
              iconPath: 'assets/icons/home.svg',
              isActive: selectedTab == 3,
            ),
          ]),
        ),
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          const DashboardPage(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isActive,
  });

  final String label;
  final String iconPath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: isActive ? primary1Color : Colors.grey,
              height: 28,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: isActive ? primary1Color : Colors.grey,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
