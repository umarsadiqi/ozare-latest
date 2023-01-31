import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/dashboard/bloc/match_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'match_tile.dart';

class UpperSection extends StatelessWidget {
  ///
  /// Upper Section of the Dashboard Page
  /// It contains the App Bar and the Match List
  ///
  const UpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      // App Bar Section
      // height: size.height * 0.25,
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
            children: const [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white30,
                child: Icon(Icons.menu, color: Colors.white),
              ),
              Text(
                'Match',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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

      // Match List Section
      // height: size.height * 0.15,
      Positioned(
        top: size.height * 0.12,
        left: 0,
        right: 0,
        child: BlocConsumer<MatchBloc, MatchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.status == MatchStatus.loading) {
              return SizedBox(
                height: size.height * 0.33 - size.height * 0.125,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.15,
                    viewportFraction: 0.8,
                    // enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: List.generate(
                      3,
                      (index) => Animate(
                            onComplete: (controller) {
                              controller.repeat();
                            },
                            effects: [
                              ShimmerEffect(
                                  duration: const Duration(milliseconds: 400),
                                  color: primary2Color.withOpacity(0.3))
                            ],
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                            ),
                          )),
                ),
              );
            } else if (state.status == MatchStatus.success) {
              return SizedBox(
                height: size.height * 0.33 - size.height * 0.125,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.15,
                    viewportFraction: 0.8,
                    // enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: List.generate(state.matches.length,
                      (index) => MatchTile(match: state.matches[index])),
                ),
              );
            }
            return const Loader(message: 'Loading...');
          },
        ),
      ),
    ]);
  }
}
