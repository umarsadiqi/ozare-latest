import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          height: 56,
          width: 56,
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
            height: 66,
            child: Row(children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {},
                  ),
                  const Text('Home'),
                ],
              )
            ]),
          ),
        ));
  }
}
