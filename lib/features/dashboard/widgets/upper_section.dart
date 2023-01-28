import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozare/consts.dart';

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
        child: SvgPicture.asset(
          'assets/images/pattern.svg',
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
                child: Icon(Icons.arrow_back, color: Colors.white),
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
        child: SizedBox(
          height: size.height * 0.33 - size.height * 0.125,
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.15,
              viewportFraction: 0.8,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: List.generate(4, (index) => const MatchTile()),
          ),

          // ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   padding: const EdgeInsets.only(left: 24, bottom: 12),
          //   itemCount: 3,
          //   itemBuilder: (context, index) {
          //     return const MatchTile();
          //   },
          // ),
        ),
      ),
    ]);
  }
}

class OvalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
