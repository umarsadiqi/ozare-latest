import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/livebet/bloc/livebet_bloc.dart';
import 'package:ozare/models/livebet.dart';

class LiveBetsView extends StatelessWidget {
  const LiveBetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'trophy',
              child: Icon(
                FontAwesome.award,
                color: primary2Color,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Your Bets',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900],
              ),
            ),
            const SizedBox(width: 32),
          ],
        ),
        actions: const [
          SizedBox(
            width: 32,
          ),
        ],
      ),
      body: BlocBuilder<LivebetBloc, LiveBetState>(
        builder: (context, state) {
          final List<LiveBet> bets = state.liveBets;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Expanded(
              child: bets.isEmpty
                  ? Center(
                      child: Text(
                        'No bets yet',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[900],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: bets.length,
                      itemBuilder: (context, index) {
                        final LiveBet bet = bets[index];
                        return ListTile(
                          title: Text('${bet.team1} vs ${bet.team2}'),
                          subtitle: Text('${bet.tokens} Tokens'),
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
