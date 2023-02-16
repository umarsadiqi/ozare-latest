import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/dash/bloc/soccer_bloc.dart';
import 'package:ozare/features/dash/widgets/league_section.dart';
import 'package:ozare/features/dash/widgets/loading_section.dart';
import 'package:ozare/features/dash/widgets/no_events_tile.dart';
import 'package:ozare/models/league.dart';

import '../bloc/basket_bloc.dart';
import '../bloc/basket_state.dart';

class BasketView extends StatelessWidget {
  const BasketView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        final status = state.status;
        if (status == BasketStatus.loading) {
          return const LoadingSection();
        } else if (status == BasketStatus.failure) {
          return Center(
            child: Text(state.message),
          );
        }
        final leagues = state.leagues;
        return leagues.isEmpty
            ? const NoEventsTile()
            : Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 32),
                  itemCount: leagues.length,
                  itemBuilder: (context, index) {
                    final League league = leagues[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: LeagueSection(
                        league: league,
                        category: 'basketball',
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
