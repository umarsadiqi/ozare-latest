import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/auth/bloc/auth_bloc.dart';
import 'package:ozare/features/auth/view/auth_page.dart';
import '../widgets/widgets.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: gradient,
              ),
            ),
            Animate(
              effects: const [
                SlideEffect(
                  begin: Offset(1, 0),
                  duration: Duration(milliseconds: 500),
                )
              ],
              child: Positioned(
                top: size.height * 0.15,
                right: 0,
                bottom: size.height * 0.1,
                child: Image.asset('assets/images/mockup.png'),
              ),
            ),
            Animate(
              effects: const [
                SlideEffect(
                  begin: Offset(-1, 0),
                  delay: Duration(milliseconds: 400),
                  duration: Duration(milliseconds: 400),
                )
              ],
              child: Positioned(
                top: size.height * 0.12,
                left: -30,
                right: size.width * 0.3,
                bottom: size.height * 0.1,
                child: Image.asset('assets/images/tiles.png'),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                height: size.height * 0.36,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: Column(children: [
                  const Spacer(),
                  const Text(
                    "Earn Tokens",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Initiate bets & earn tokens directly from your Telegram group chats',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(3, (index) => buildDot(index: index)),
                  ),
                  const Spacer(),
                  Animate(
                    onComplete: (controller) {
                      controller.repeat();
                    },
                    effects: const [
                      // repeat this effect

                      ShimmerEffect(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 900),
                      )
                    ],
                    child: CButton(
                      onTap: () {
                        context
                            .read<AuthBloc>()
                            .add(const AuthOnboardingCompleted());
                      },
                      label: 'Get Started',
                    ),
                  ),
                  const Spacer(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 7),
      height: _currentPage == index ? 8 : 8,
      width: _currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
          color: _currentPage == index ? primary1Color : Colors.grey[200],
          shape:
              _currentPage == index ? BoxShape.rectangle : BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
