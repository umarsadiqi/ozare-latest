import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:ozare/features/dash/bloc/basket_bloc.dart';
import 'package:ozare/features/dash/bloc/basket_event.dart';
import 'package:ozare/features/dash/bloc/soccer_bloc.dart';
import 'package:ozare/features/dash/widgets/widgets.dart';
import 'package:ozare/translations/locale_keys.g.dart';

import 'basket_view.dart';
import 'soccer_view.dart';

class DashView extends StatefulWidget {
  const DashView({
    super.key,
  });

  @override
  State<DashView> createState() => _DashViewState();
}

class _DashViewState extends State<DashView> {
  int selectedTab = 0;

  final _tabs = [
    const SoccerView(),
    const BasketView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///// APP BAR /////

        const UpperSection(),

        /// Match Categories
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MatchCategoryTabItem(
                isActive: selectedTab == 0,
                label: LocaleKeys.soccer.tr(),
                onTap: () {
                  if (selectedTab == 0) return;
                  context.read<BasketBloc>().add(const BasketToggleLive());

                  context
                      .read<SoccerBloc>()
                      .add(const SoccerLeaguesRequested());
                  setState(() {
                    selectedTab = 0;
                  });
                },
                icon: FontAwesome5.futbol,
              ),
              MatchCategoryTabItem(
                isActive: selectedTab == 1,
                label: LocaleKeys.basketball.tr(),
                onTap: () {
                  if (selectedTab == 1) return;
                  context.read<SoccerBloc>().add(const SoccerToggleLive());
                  context
                      .read<BasketBloc>()
                      .add(const BasketLeaguesRequested());
                  setState(() {
                    selectedTab = 1;
                  });
                },
                icon: FontAwesome5.basketball_ball,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _tabs[selectedTab],
      ],
    );
  }
}
