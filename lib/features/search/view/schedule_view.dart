import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/search/bloc/search_bloc.dart';
import 'package:ozare/features/search/models/team.dart';
import 'package:ozare/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({
    super.key,
    required this.fixtures,
    required this.team,
  });

  final List<Fixture> fixtures;
  final Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            context.read<SearchBloc>().add(const SearchScheduleBackPressed());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          '${team.name}\'s Schedule',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: fixtures.isEmpty
          ? const Center(
              child: Text("No Schedule found!"),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 66),
              itemCount: fixtures.length,
              itemBuilder: (context, index) =>
                  ScheduleTile(fixture: fixtures[index]),
            ),
    );
  }
}

class ScheduleTile extends StatelessWidget {
  const ScheduleTile({
    super.key,
    required this.fixture,
  });

  final Fixture fixture;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/bg.png',
          ),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.hardLight),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: primary2Color.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  fixture.team1Logo,
                  height: size.height * 0.07,
                ),
                const SizedBox(height: 2),
                SizedBox(
                  height: size.height * 0.04,
                  child: AutoSizeText(
                    fixture.team1Name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              const Text(
                "VS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 64,
                child: AutoSizeText(
                  fixture.venueCity,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxFontSize: 10,
                  minFontSize: 9,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  fixture.team2Logo,
                  height: size.height * 0.07,
                ),
                const SizedBox(height: 2),
                SizedBox(
                  height: size.height * 0.04,
                  child: AutoSizeText(
                    fixture.team2Name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
