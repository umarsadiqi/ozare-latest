import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/profile/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.32,
          width: size.width,
          child: Stack(alignment: Alignment.center, children: [
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
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white30,
                      child: Icon(Icons.notifications_outlined,
                          color: Colors.white),
                    ),
                  ],
                )),

            Positioned(
              top: size.height * 0.135,
              left: 0,
              right: 0,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                PButton(
                  label: 'Account',
                  icon: Icons.person_outline,
                  onTap: () {},
                ),
                Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/user.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                PButton(
                  label: 'Settings',
                  icon: Icons.settings_outlined,
                  onTap: () {},
                ),
              ]),
            ),

            const Positioned(
                bottom: 0,
                child: Text(
                  'Andy Smith',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ))
          ]),
        ),

        const SizedBox(height: 24),

        /// wins and losses
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            StatBox(
              label: 'Wins',
              value: 200,
            ),
            SizedBox(width: 16),
            StatBox(
              label: 'Losses',
              value: 32,
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// Recent History
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Recent History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 64, left: 24, right: 24),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const HistoryItem();
                })),
      ],
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.25,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'St. Germain',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/logo1.png'),
            ),
            const SizedBox(width: 8),
            const Text(
              "VS",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/logo2.png'),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: size.width * 0.25,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Man Utd',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              height: 32,
              width: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF00BA88).withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Center(
                child: Text(
                  'Win',
                  style: TextStyle(
                    color: Color(0xFF00BA88),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
