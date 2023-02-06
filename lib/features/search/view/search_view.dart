import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ozare/features/dash/widgets/upper_section.dart';
import 'package:ozare/features/search/bloc/search_bloc.dart';
import 'package:ozare/features/search/models/team.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
    required this.teams,
    required this.state,
  });

  final List<Team> teams;
  final SearchState state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const UpperSection(),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 24),
            child: Text(
              "Showing Results for '${state.query}'",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 24),
            child: Text(
              'Teams (${teams.length})',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                  fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 72,
          width: size.width,
          child: CarouselSlider.builder(
            itemCount: teams.length,
            itemBuilder: (context, index, _) {
              final Team team = teams[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(children: [
                  Container(
                    height: 58,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                    child: Image.network(team.logo),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(team.name),
                      Row(
                        children: [
                          Text(
                            'Country: ',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            team.country,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.8,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        )
      ],
    );
  }
}
