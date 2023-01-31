import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozare/consts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ozare/features/dashboard/view/dashbaord_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/home/home.dart';
import 'package:ozare/features/profile/view/profile_page.dart';
import 'package:ozare/features/profile/view/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tabIndex);
    final hideStatus = context.select((HomeCubit cubit) => cubit.state.hide);
    final size = MediaQuery.of(context).size;
    log('selected Tab: ${selectedTab.toString()}');
    log('hideStatus: ${hideStatus.toString()}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: !hideStatus
          ? Container(
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
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: !hideStatus
          ? BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: SizedBox(
                height: 68,
                width: size.width,
                child: Row(children: [
                  BottomNavItem(
                    label: 'Home',
                    iconPath: 'assets/icons/home.svg',
                    isActive: selectedTab == 0,
                    onTap: () {
                      context.read<HomeCubit>().setTab(0);
                    },
                  ),
                  BottomNavItem(
                    label: 'Payments',
                    iconPath: 'assets/icons/wallet.svg',
                    isActive: selectedTab == 1,
                    onTap: () {
                      context.read<HomeCubit>().setTab(1);
                    },
                  ),
                  const Spacer(),
                  BottomNavItem(
                    label: 'Notifications',
                    iconPath: 'assets/icons/bell.svg',
                    isActive: selectedTab == 2,
                    onTap: () {
                      context.read<HomeCubit>().setTab(2);
                    },
                  ),
                  BottomNavItem(
                    label: 'Profile',
                    iconPath: 'assets/images/user.png',
                    isActive: selectedTab == 3,
                    isProfile: true,
                    onTap: () {
                      context.read<HomeCubit>().setTab(3);
                    },
                  ),
                ]),
              ),
            )
          : null,
      body: IndexedStack(
        index: selectedTab,
        children: const [
          DashboardPage(),
          PaymentsPage(),
          NotificationsPage(),
          ProfilePage(),
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
    required this.onTap,
    this.isProfile = false,
  });

  final String label;
  final String iconPath;
  final bool isActive;
  final bool isProfile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: isProfile
            ?
            // Profile Nav Item
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedBorder(
                    borderType: BorderType.Circle,
                    color: isActive ? primary1Color : Colors.grey,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundImage: AssetImage(iconPath),
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: isActive ? primary1Color : Colors.grey,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              )
            :
            // Default Nav Item
            Column(
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
                  const SizedBox(height: 4),
                ],
              ),
      ),
    );
  }
}
