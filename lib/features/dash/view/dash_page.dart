import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/dash/bloc/dash_bloc.dart';
import 'package:ozare/features/event/event.dart';
import 'package:ozare/features/event/view/event_page.dart';
import 'package:ozare/models/models.dart';

import '../widgets/widgets.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          ///// APP BAR /////

          SizedBox(
            height: size.height * 0.21,
            width: size.width,
            child: Stack(children: [
              // Oval Bottom Clipper
              Positioned(
                top: 0,
                child: SizedBox(
                  height: size.height * 0.21,
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

              // Pattern Image
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/pattern.png',
                  color: Colors.white.withOpacity(0.11),
                  width: size.width,
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),

              // Menu & Title
              Positioned(
                  top: 46,
                  right: 24,
                  left: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white30,
                        child: Icon(Icons.menu, color: Colors.white),
                      ),
                      Text(
                        'Ozare',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white30,
                        child: Icon(Icons.more_vert, color: Colors.white),
                      ),
                    ],
                  )),

              // SearchBar
              Positioned(
                top: size.height * 0.115,
                child: Container(
                  height: 50,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: TextField(
                    scrollPadding: const EdgeInsets.only(left: 22),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 22),
                        hintText: 'Search ...',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: const BorderSide(
                              color: primary2Color,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: const BorderSide(
                              color: primary2Color,
                            )),
                        suffixIcon: const Icon(Icons.search)),
                  ),
                ),
              ),
            ]),
          ),

          /// Match Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                MatchCategoryTabItem(
                  isActive: selectedTab == 0,
                  label: 'Soccer',
                  onTap: () {
                    if (selectedTab != 0) {
                      context
                          .read<DashBloc>()
                          .add(const DashCategoryChanged('soccer'));
                      setState(() {
                        selectedTab = 0;
                      });
                    }
                  },
                  icon: FontAwesome5.futbol,
                ),
                MatchCategoryTabItem(
                  isActive: selectedTab == 1,
                  label: 'Basketball',
                  onTap: () {
                    if (selectedTab != 1) {
                      context
                          .read<DashBloc>()
                          .add(const DashCategoryChanged('basketball'));
                      setState(() {
                        selectedTab = 1;
                      });
                    }
                  },
                  icon: FontAwesome5.basketball_ball,
                ),
                MatchCategoryTabItem(
                  isActive: selectedTab == 2,
                  label: 'Cricket',
                  onTap: () {
                    // setState(() {
                    //   selectedTab = 2;
                    // });
                  },
                  icon: Maki.cricket,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          /// MATCHES LISTS \\\
          BlocConsumer<DashBloc, DashState>(
            listener: (context, state) {},
            builder: (context, state) {
              log('Dash State: ${state.status.toString()}');
              if (state.status == DashStatus.loading) {
                return const LoadingSection();
              } else if (state.status == DashStatus.success) {
                final List<League> leagues = state.leagues;
                log('Leagues Length: ${leagues.length.toString()}');
                if (leagues.isEmpty) {
                  return const NoEventsTile();
                }
                // tpo
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 32),
                    itemCount: leagues.length,
                    itemBuilder: (context, index) {
                      final League league = leagues[index];
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: LeagueSection(league: league));
                    },
                  ),
                );
              }
              return const Loader(message: 'Loading...');
            },
          ),
        ],
      ),
    );
  }
}

class LoadingSection extends StatelessWidget {
  const LoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 190,
      width: size.width,
      child: CarouselSlider.builder(
        itemCount: 3,
        options: CarouselOptions(
          height: 190,
          viewportFraction: 0.84,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (_, __, ___) => const LoadingMatchTile(),
      ),
    );
  }
}

class LeagueSection extends StatelessWidget {
  const LeagueSection({
    super.key,
    required this.league,
  });

  final League league;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Event> events = league.events;
    return SizedBox(
      height: 216,
      width: size.width,
      child: Column(
        children: [
          // League Title
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 24),
            child: Row(
              children: [
                const Icon(
                  FontAwesome5.futbol,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  '${league.name} (${league.events.length})',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 190,
            width: size.width,
            child: CarouselSlider.builder(
              itemCount: events.length,
              options: CarouselOptions(
                height: 190,
                viewportFraction: 0.84,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, _) {
                final event = events[index];

                return GestureDetector(
                    onTap: () {
                      context
                          .read<EventBloc>()
                          .add(EventInitializedRequested(event: event));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(
                            eventId: event.id,
                            leagueId: league.id,
                            event: event,
                          ),
                        ),
                      );
                    },
                    child: EventTile(event: event));
              },
            ),
          ),
        ],
      ),
    );
  }
}
